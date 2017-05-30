------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--                S Y S T E M . B B . B O A R D _ S U P P O R T             --
--                                                                          --
--                                  B o d y                                 --
--                                                                          --
--        Copyright (C) 1999-2002 Universidad Politecnica de Madrid         --
--             Copyright (C) 2003-2006 The European Space Agency            --
--                     Copyright (C) 2003-2017, AdaCore                     --
--                                                                          --
-- GNARL is free software; you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion. GNARL is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNARL was developed by the GNARL team at Florida State University.       --
-- Extensive contributions were provided by Ada Core Technologies, Inc.     --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------

--  This is the ARMv8-A + GICv2 version of this package

with Ada.Unchecked_Conversion;
with System.Machine_Code;
with System.BB.CPU_Primitives.Multiprocessors;
with System.BB.Parameters;
with Interfaces; use Interfaces;
with Interfaces.AArch64;

package body System.BB.Board_Support is
   use CPU_Primitives, BB.Interrupts, AArch64, Parameters;
   use System.Machine_Code;
   use System.Multiprocessors;

   -----------
   -- Timer --
   -----------

   Alarm_Interrupt_ID : constant BB.Interrupts.Interrupt_ID :=
                          (case Runtime_EL is
                              when 1 => 30,  --  Phys. Non-secure timer
                              when 2 => 26); --  Phys. Hypervisor timer

   --  System time stamp generator
   IOU_SCNTRS_Base_Address : constant := 16#FF26_0000#;
   SCNTRS_CTRL : Unsigned_32
     with Volatile, Import, Address => IOU_SCNTRS_Base_Address;
   SCNTRS_FREQ : Unsigned_32
     with Volatile, Import, Address => IOU_SCNTRS_Base_Address + 16#20#;

   subtype PRI is Unsigned_8;
   --  Type for GIC interrupt priorities. Note that 0 is the highest
   --  priority, which is reserved for the kernel and has no corresponding
   --  Interrupt_Priority value, and 255 is the lowest. We assume the
   --  PRIGROUP setting is such that the 4 most significant bits determine
   --  the priority group used for preemption. However, if less bits are
   --  implemented, this should still work.

   function To_PRI (P : Integer) return PRI;
   pragma Inline (To_PRI);
   --  Return the PRI mask for the given Ada priority. Note that the zero
   --  value here means no mask, so no interrupts are masked.

   function To_PRI (P : Integer) return PRI is
   begin
      if P < Interrupt_Priority'First then
         --  Do not mask any interrupt
         return 255;
      else
         --  change range 241 .. 254
         return PRI (Interrupt_Priority'Last - P + 1) * 16;
      end if;
   end To_PRI;

   package GIC is
      --  This is support package for the GIC400 interrupt controller
      --  This controller complies with the ARM Generic Interrupt Controller
      --  v2.0 specification

      --  Supports up to 192 interrupts
      Max_Ints : constant := 192;

      subtype GIC_Interrupts is BB.Interrupts.Interrupt_ID;

      function Reg_Num_32 (Intnum : GIC_Interrupts) return GIC_Interrupts
      is (Intnum / 32);

      --  32-bit registers set
      --  Accessed by 32 bits chunks
      type Bits32_Register_Array is
        array (GIC_Interrupts range 0 .. Max_Ints / 32 - 1) of Unsigned_32
        with Pack, Volatile;

      --  Byte registers set
      --  Accessed by 8 bits chunks
      type Byte_Register_Array is array (GIC_Interrupts) of Unsigned_8
        with Pack, Volatile;

      GIC_Base_Addr  : constant := 16#F902_0000#;
      GICD_Base_Addr : constant := 16#F901_0000#;

      GICD_CTLR         : Unsigned_32
        with Import, Volatile, Address => GICD_Base_Addr;

      --  Enable set registers
      GICD_ISENABLER    : Bits32_Register_Array
        with Import, Address => GICD_Base_Addr + 16#100#;

      --  Enable clear registers
      GICD_ICENABLER    : Bits32_Register_Array
        with Import, Address => GICD_Base_Addr + 16#180#;

      --  Pending set registers
      GICD_ISACTIVER    : Bits32_Register_Array
        with Import, Address => GICD_Base_Addr + 16#300#;

      --  Pending clear registers
      GICD_ICACTIVER    : Bits32_Register_Array
        with Import, Address => GICD_Base_Addr + 16#380#;

      --  Priority registers
      GICD_IPRIORITYR   : Byte_Register_Array
        with Import, Address => GICD_Base_Addr + 16#400#;

      --  Target set register
      --  the bitfield represent the CPUs on which the exception is propagated
      GICD_ITARGETSR    : array (0 .. Max_Ints / 4 - 1) of Unsigned_32
        with Import, Volatile, Address => GICD_Base_Addr + 16#800#;

      GICD_ICFGR        : array (0 .. Max_Ints / 16 - 1) of Unsigned_32
        with Import, Volatile, Address => GICD_Base_Addr + 16#C00#;

      GICD_SGIR         : Unsigned_32
        with Import, Address => GICD_Base_Addr + 16#F00#;

      GICC_CTLR         : Unsigned_32
        with Volatile, Import, Address => GIC_Base_Addr;

      GICC_PMR          : Unsigned_32
        with Volatile, Import, Address => GIC_Base_Addr + 16#004#;

      GICC_BPR          : Unsigned_32
        with Volatile, Import, Address => GIC_Base_Addr + 16#008#;

      GICC_IAR          : Unsigned_32
        with Volatile, Import, Address => GIC_Base_Addr + 16#00C#;

      GICC_EOIR         : Unsigned_32
        with Volatile, Import, Address => GIC_Base_Addr + 16#010#;
   end GIC;

--     package IPI is
--        IPI_BASEADDR : constant := 16#FF30_0000#;
--
--        IPI_TRIG_OFFSET     : constant := 16#0#;
--        IPI_OBS_OFFSET      : constant := 16#4#;
--
--        IPI_TRIG     : Unsigned_32
--          with Volatile, Import, Address => IPI_BASEADDR + IPI_TRIG_OFFSET;
--        IPI_OBS      : Unsigned_32
--          with Volatile, Import, Address => IPI_BASEADDR + IPI_OBS_OFFSET;
--
--        IPI_BUFFER_BASEADDR : constant := 16#FF99_0000#;
--
--        IPI_BUFFER_APU_BASE : constant := IPI_BUFFER_BASEADDR + 16#400#;
--  --        IPI_BUFFER_PMU_BASE : constant := IPI_BUFFER_BASEADDR + 16#E00#;
--
--        IPI_BUFFER_TARGET_PMU_OFFSET : constant := 16#1C0#;
--        IPI_BUFFER_REQ_OFFSET        : constant := 16#00#;
--  --        IPI_BUFFER_RESP_OFFSET       : constant := 16#20#;
--
--        type PM_Payload is array (1 .. 5) of Unsigned_32;
--        PM_REQ_WAKEUP        : constant := 10;
--        Node_Id              : constant array (CPU) of Unsigned_32 :=
--                                 (2, 3, 4, 5);
--  --        REQ_ACK_NO           : constant := 1;
--        REQ_ACK_BLOCKING     : constant := 2;
--  --        REQ_ACK_NON_BLOCKING : constant := 3;
--
--     end IPI;

   package APU is
      type Power_Down_Array is array (CPU) of Boolean with Pack;
      type UInt12 is mod 2 ** 12 with Size => 12;
      type UInt14 is mod 2 ** 14 with Size => 14;

      type POWERCTL_Register is record
         CPUPWRDWNREQ : Power_Down_Array;
         Unused_4_15  : UInt12;
         L2FLUSH_REQ  : Boolean;
         CLREXMONREQ  : Boolean;
         Unused_18_31 : UInt14;
      end record with Volatile_Full_Access, Size => 32;

      for POWERCTL_Register use record
         CPUPWRDWNREQ at 0 range 0 .. 3;
         Unused_4_15  at 0 range 4 .. 15;
         L2FLUSH_REQ  at 0 range 16 .. 16;
         CLREXMONREQ  at 0 range 17 .. 17;
         Unused_18_31 at 0 range 18 .. 31;
      end record;

      type APU_Registers is record
         ERR_CTRL     : Unsigned_32;
         ISR          : Unsigned_32;
         IMR          : Unsigned_32;
         IEN          : Unsigned_32;
         IDS          : Unsigned_32;
         CONFIG_0     : Unsigned_32;
         CONFIG_1     : Unsigned_32;
         RVBAR_ADDR0L : Unsigned_32;
         RVBAR_ADDR0H : Unsigned_32;
         RVBAR_ADDR1L : Unsigned_32;
         RVBAR_ADDR1H : Unsigned_32;
         RVBAR_ADDR2L : Unsigned_32;
         RVBAR_ADDR2H : Unsigned_32;
         RVBAR_ADDR3L : Unsigned_32;
         RVBAR_ADDR3H : Unsigned_32;
         ACE_CTRL     : Unsigned_32;
         SNOOP_CTRL   : Unsigned_32;
         PWRCTL       : POWERCTL_Register;
         PWRSTAT      : Unsigned_32;
      end record with Volatile;

      for APU_Registers use record
         ERR_CTRL     at 16#00# range 0 .. 31;
         ISR          at 16#10# range 0 .. 31;
         IMR          at 16#14# range 0 .. 31;
         IEN          at 16#18# range 0 .. 31;
         IDS          at 16#1C# range 0 .. 31;
         CONFIG_0     at 16#20# range 0 .. 31;
         CONFIG_1     at 16#24# range 0 .. 31;
         RVBAR_ADDR0L at 16#40# range 0 .. 31;
         RVBAR_ADDR0H at 16#44# range 0 .. 31;
         RVBAR_ADDR1L at 16#48# range 0 .. 31;
         RVBAR_ADDR1H at 16#4C# range 0 .. 31;
         RVBAR_ADDR2L at 16#50# range 0 .. 31;
         RVBAR_ADDR2H at 16#54# range 0 .. 31;
         RVBAR_ADDR3L at 16#58# range 0 .. 31;
         RVBAR_ADDR3H at 16#5C# range 0 .. 31;
         ACE_CTRL     at 16#60# range 0 .. 31;
         SNOOP_CTRL   at 16#80# range 0 .. 31;
         PWRCTL       at 16#90# range 0 .. 31;
         PWRSTAT      at 16#94# range 0 .. 31;
      end record;

      Regs : APU_Registers with Import, Address => 16#FD5C_0000#;

   end APU;

--     package PMU_GLOBAL is
--        --  PMU_GLOBAL peripheral registers
--        GLOBAL_CNTRL     : Unsigned_32
--          with Volatile, Import, Address => 16#FFD80000#;
--        REQ_PWRUP_STATUS : Unsigned_32
--          with Volatile, Import, Address => 16#FFD80110#;
--        REQ_PWRUP_INT_EN : Unsigned_32
--          with Volatile, Import, Address => 16#FFD80118#;
--        REQ_PWRUP_TRIG   : Unsigned_32
--          with Volatile, Import, Address => 16#FFD80120#;
--        REQ_SWRST_INT_EN : Unsigned_32
--          with Volatile, Import, Address => 16#FFD80418#;
--        REQ_SWRST_TRIG   : Unsigned_32
--          with Volatile, Import, Address => 16#FFD80420#;
--     end PMU_GLOBAL;

   procedure IRQ_Handler;
   pragma Export (C, IRQ_Handler, "__gnat_irq_handler");
   --  Low-level interrupt handler

   procedure Initialize_CPU_Devices;
   pragma Export (C, Initialize_CPU_Devices, "__gnat_initialize_cpu_devices");
   --  Per CPU device initialization

   ----------------------------
   -- Initialize_CPU_Devices --
   ----------------------------

   procedure Initialize_CPU_Devices is
   begin
      --  Timer: using the non-secure physical timer
      --  at init, we disable both the physical and the virtual timers
      --  the pysical timer is awaken when we need it.

      --  Disable CNTP and mask.
      Set_CNTP_CTL (2);

      --  Disable CNTV and mask.
      Set_CNTV_CTL_EL0 (2);

      --  Core-specific part of the GIC configuration:
      --  The GICC (CPU Interface) is banked for each CPU, so has to be
      --  configured each time.
      --  The PPI and SGI exceptions are also CPU-specific so are banked.
      --  see 4.1.4 in the ARM GIC Architecture Specification v2 document

      --  Mask all interrupts
      GIC.GICC_PMR := 0;

      --  Binary point register
      --  The register defines the point at which the priority value fields
      --  split into two parts
      GIC.GICC_BPR := 3;

      --  Disable the CPU-specific interrupts
      GIC.GICD_ICENABLER (0) := 16#FFFF_FFFF#;

      --  Set the Enable Group1 bit to the GICC CTLR register
      --  The view we have here is a GICv2 version with Security extension,
      --  from a non-secure mode
      GIC.GICC_CTLR := 1;

      --  Set prio of Poke interrupt (banked register)
      GIC.GICD_IPRIORITYR (0) := To_PRI (Interrupt_Priority'Last);

      --  Set prio of Timer interrupt (banked register)
      GIC.GICD_IPRIORITYR (Alarm_Interrupt_ID) :=
        To_PRI (Interrupt_Priority'Last);
      --  Enable the interrupt
      GIC.GICD_ISENABLER (0) := 2 ** Natural (Alarm_Interrupt_ID);
   end Initialize_CPU_Devices;

   ----------------------
   -- Initialize_Board --
   ----------------------

   procedure Initialize_Board
   is
      use GIC;

   begin
      GICD_CTLR := 0;

      --  default priority
      for J in GICD_IPRIORITYR'Range loop
         GICD_IPRIORITYR (J) := To_PRI (System.Default_Priority);
      end loop;

      --  Target: always target cpu 0

      --  Ignore the first 32 interrupts that are CPU-specific anyway
      --  There's 4 interrupt per ITARGETSR register
      for Reg_Num in 8 .. GIC.GICD_ITARGETSR'Last loop
         GIC.GICD_ITARGETSR (Reg_Num) := 16#01_01_01_01#;
      end loop;

      --  Disable all shared Interrupts
      GICD_ICENABLER (1) := 16#FFFF_FFFF#;
      GICD_ICENABLER (2) := 16#FFFF_FFFF#;
      GICD_ICENABLER (3) := 16#FFFF_FFFF#;
      GICD_ICENABLER (4) := 16#FFFF_FFFF#;
      GICD_ICENABLER (5) := 16#FFFF_FFFF#;

      GICD_CTLR := 1;

      Initialize_CPU_Devices;
   end Initialize_Board;

   package body Time is

      ------------------------
      -- Max_Timer_Interval --
      ------------------------

      function Max_Timer_Interval return Timer_Interval is (2**31 - 1);
      --  Negative values in CNTP_TVAL triggers interrupts, so use the most
      --  positive value.

      ---------------
      -- Set_Alarm --
      ---------------

      procedure Set_Alarm (Ticks : Timer_Interval) is
      begin
         --  Set CNTP_TVAL_EL
         Set_CNTP_TVAL (Unsigned_32 (Ticks));

         --  Set CNTP_CTL (enable and unmask)
         Set_CNTP_CTL (1);
      end Set_Alarm;

      ----------------
      -- Read_Clock --
      ----------------

      function Read_Clock return BB.Time.Time is
      begin
         --  Read CNTPCT
         return BB.Time.Time (Get_CNTPCT_EL0);
      end Read_Clock;

      ---------------------------
      -- Install_Alarm_Handler --
      ---------------------------

      procedure Install_Alarm_Handler (Handler : Interrupt_Handler)
      is

      begin
         --  Attach interrupt handler
         BB.Interrupts.Attach_Handler
           (Handler,
            Alarm_Interrupt_ID,
            Interrupt_Priority'Last);
      end Install_Alarm_Handler;

      ---------------------------
      -- Clear_Alarm_Interrupt --
      ---------------------------

      procedure Clear_Alarm_Interrupt is
      begin
         --  Disable and mask
         Set_CNTP_CTL (2);
      end Clear_Alarm_Interrupt;
   end Time;

   -----------------
   -- IRQ_Handler --
   -----------------

   procedure IRQ_Handler
   is
      IAR    : constant Unsigned_32 := GIC.GICC_IAR;
      Int_Id : constant Unsigned_32 := IAR and 16#3FF#;
   begin
      if Int_Id = 16#3FF# then
         --  Spurious interrupt
         return;
      end if;

      Interrupt_Wrapper (Interrupt_ID (Int_Id));

      --  Clear interrupt request
      GIC.GICC_EOIR := IAR;
   end IRQ_Handler;

   package body Interrupts is

      function To_Priority (P : PRI) return Interrupt_Priority;
      pragma Inline (To_Priority);
      --  Given an ARM interrupt priority (PRI value), determine the Ada
      --  priority While the value 0 is reserved for the kernel and has no Ada
      --  priority that represents it, Interrupt_Priority'Last is closest.
      --  ??? The compiler crashes if this is an expression function.

      function To_Priority (P : PRI) return Interrupt_Priority is
      begin
         if P = 0 then
            return Interrupt_Priority'Last;
         else
            return Interrupt_Priority'Last - Any_Priority'Base (P / 16) + 1;
         end if;
      end To_Priority;

      -------------------------------
      -- Install_Interrupt_Handler --
      -------------------------------

      procedure Install_Interrupt_Handler
        (Interrupt : BB.Interrupts.Interrupt_ID;
         Prio      : Interrupt_Priority)
      is
         use GIC;
      begin
         GICD_IPRIORITYR (Interrupt) := To_PRI (Prio);
         GICD_ISENABLER (Reg_Num_32 (Interrupt)) :=
           2 ** (Interrupt mod 32);
      end Install_Interrupt_Handler;

      ---------------------------
      -- Priority_Of_Interrupt --
      ---------------------------

      function Priority_Of_Interrupt
        (Interrupt : System.BB.Interrupts.Interrupt_ID)
        return System.Any_Priority
      is
      begin
         return To_Priority (GIC.GICD_IPRIORITYR (Interrupt));
      end Priority_Of_Interrupt;

      --------------------------
      -- Set_Current_Priority --
      --------------------------

      procedure Set_Current_Priority (Priority : Integer) is
      begin
         GIC.GICC_PMR := Unsigned_32 (To_PRI (Priority));
      end Set_Current_Priority;

      ----------------
      -- Power_Down --
      ----------------

      procedure Power_Down is
      begin
         Asm ("wfi", Volatile => True);
      end Power_Down;
   end Interrupts;

   package body Multiprocessors is
      Poke_Interrupt : constant Interrupt_ID := 0;
      --  Use SGI #0

      procedure Poke_Handler (Interrupt : BB.Interrupts.Interrupt_ID);
      --  Handler for the Poke interrupt

      procedure Start_Ram
        with Import, External_Name => "__start_ram";
      --  Entry point (in crt0) for a slave cpu

--        procedure Poke_Handler (Interrupt : BB.Interrupts.Interrupt_ID);
      --  Handler for the Poke interrupt

      function MPIDR return Unsigned_32 with Inline_Always;
      --  Return current value of the MPIDR register

      procedure CPU_Wake_Up
        (CPU_Id        : CPU;
         Start_Address : System.Address);
      --  Reset and wake_up the specified CPU

      --------------------
      -- Number_Of_CPUs --
      --------------------

      function Number_Of_CPUs return CPU is
      begin
         return CPU'Last;
      end Number_Of_CPUs;

      -----------
      -- MPIDR --
      -----------

      function MPIDR return Unsigned_32 is
         R : Unsigned_32;
      begin
         Asm ("mrs %0, mpidr_el1",
              Outputs => Unsigned_32'Asm_Output ("=r", R),
              Volatile => True);
         return R and 3;
      end MPIDR;

      -----------------
      -- Current_CPU --
      -----------------

      function Current_CPU return CPU is

         --  Get CPU Id from bits 1:0 from the MPIDR register

         (if CPU'Last = 1 then 1 else CPU ((MPIDR and 3) + 1));

      --------------
      -- Poke_CPU --
      --------------

      procedure Poke_CPU (CPU_Id : CPU)
      is
      begin
         GIC.GICD_SGIR :=
           2 ** (15 + Natural (CPU_Id)) + Unsigned_32 (Poke_Interrupt);
      end Poke_CPU;

      -----------------
      -- CPU_Wake_Up --
      -----------------

      procedure CPU_Wake_Up
        (CPU_Id        : CPU;
         Start_Address : System.Address)
      is
         function To_U64 is new Ada.Unchecked_Conversion
           (System.Address, Unsigned_64);

         RST_FPD_APU : Unsigned_16
           with Volatile, Import, Address => 16#FD1A0104#;

         Addr   : constant Unsigned_64 := To_U64 (Start_Address);
         Addr_L : constant Unsigned_32 := Unsigned_32 (Addr and 16#FFFF_FFFF#);
         Addr_H : constant Unsigned_32 := Unsigned_32 (Shift_Right (Addr, 32));

         Pwron_Rst_Mask : constant Unsigned_16 :=
                            Shift_Left (1, Natural (CPU_Id) + 9);
         Rst_Mask       : constant Unsigned_16 :=
                            Shift_Left (1, Natural (CPU_Id) - 1);
         Rst_Value      : Unsigned_16;

      begin
         --  Make sure the target CPU is powered
         APU.Regs.PWRCTL.CPUPWRDWNREQ (CPU_Id) := False;

         --  Assert the power-on-reset
         Rst_Value := RST_FPD_APU;
         if (Rst_Value and Pwron_Rst_Mask) = 0 then
            Rst_Value := Rst_Value or Pwron_Rst_Mask;
            RST_FPD_APU := Rst_Value;
         end if;

         --  Set the APU start address
         case CPU_Id is
         when 1 =>
            APU.Regs.RVBAR_ADDR0L := Addr_L;
            APU.Regs.RVBAR_ADDR0H := Addr_H;
         when 2 =>
            APU.Regs.RVBAR_ADDR1L := Addr_L;
            APU.Regs.RVBAR_ADDR1H := Addr_H;
         when 3 =>
            APU.Regs.RVBAR_ADDR2L := Addr_L;
            APU.Regs.RVBAR_ADDR2H := Addr_H;
         when 4 =>
            APU.Regs.RVBAR_ADDR3L := Addr_L;
            APU.Regs.RVBAR_ADDR3H := Addr_H;
         end case;

         --  Release the reset line if needed
         if (Rst_Value and Rst_Mask) = Rst_Mask then
            Rst_Value := Rst_Value and not Rst_Mask;
            RST_FPD_APU := Rst_Value;
         end if;

         --  Release the power-on-reset line
         RST_FPD_APU := Rst_Value and not Pwron_Rst_Mask;
      end CPU_Wake_Up;

      --------------------
      -- Start_All_CPUs --
      --------------------

      procedure Start_All_CPUs is
      begin
         BB.Interrupts.Attach_Handler
           (Poke_Handler'Access, Poke_Interrupt, Interrupt_Priority'Last);

         --  Disable warnings for non-SMP case
         pragma Warnings (Off, "loop range is null*");

         for CPU_Id in CPU'First + 1 .. CPU'Last loop
            CPU_Wake_Up (CPU_Id, Start_Ram'Address);
         end loop;

         pragma Warnings (On, "loop range is null*");
      end Start_All_CPUs;

      ------------------
      -- Poke_Handler --
      ------------------

      procedure Poke_Handler (Interrupt : BB.Interrupts.Interrupt_ID) is
      begin
         --  Make sure we are handling the right interrupt

         pragma Assert (Interrupt = Poke_Interrupt);

         System.BB.CPU_Primitives.Multiprocessors.Poke_Handler;
      end Poke_Handler;

   end Multiprocessors;

end System.BB.Board_Support;