--
--  Copyright (C) 2019, AdaCore
--

--  Copyright (c) 2018 Microchip Technology Inc.
--
--  SPDX-License-Identifier: Apache-2.0
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--  http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.

--  This spec has been automatically generated from ATSAMD21G18A.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package Interfaces.SAMD.PM is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   --  Idle Mode Configuration
   type SLEEP_IDLESelect is
     (--  The CPU clock domain is stopped
      Cpu,
      --  The CPU and AHB clock domains are stopped
      Ahb,
      --  The CPU, AHB and APB clock domains are stopped
      Apb)
     with Size => 2;
   for SLEEP_IDLESelect use
     (Cpu => 0,
      Ahb => 1,
      Apb => 2);

   --  Sleep Mode
   type PM_SLEEP_Register is record
      --  Idle Mode Configuration
      IDLE         : SLEEP_IDLESelect := Interfaces.SAMD.PM.Cpu;
      --  unspecified
      Reserved_2_7 : Interfaces.SAMD.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_SLEEP_Register use record
      IDLE         at 0 range 0 .. 1;
      Reserved_2_7 at 0 range 2 .. 7;
   end record;

   --  CPU Prescaler Selection
   type CPUSEL_CPUDIVSelect is
     (--  Divide by 1
      Div1,
      --  Divide by 2
      Div2,
      --  Divide by 4
      Div4,
      --  Divide by 8
      Div8,
      --  Divide by 16
      Div16,
      --  Divide by 32
      Div32,
      --  Divide by 64
      Div64,
      --  Divide by 128
      Div128)
     with Size => 3;
   for CPUSEL_CPUDIVSelect use
     (Div1 => 0,
      Div2 => 1,
      Div4 => 2,
      Div8 => 3,
      Div16 => 4,
      Div32 => 5,
      Div64 => 6,
      Div128 => 7);

   --  CPU Clock Select
   type PM_CPUSEL_Register is record
      --  CPU Prescaler Selection
      CPUDIV       : CPUSEL_CPUDIVSelect := Interfaces.SAMD.PM.Div1;
      --  unspecified
      Reserved_3_7 : Interfaces.SAMD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_CPUSEL_Register use record
      CPUDIV       at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  APBA Prescaler Selection
   type APBASEL_APBADIVSelect is
     (--  Divide by 1
      Div1,
      --  Divide by 2
      Div2,
      --  Divide by 4
      Div4,
      --  Divide by 8
      Div8,
      --  Divide by 16
      Div16,
      --  Divide by 32
      Div32,
      --  Divide by 64
      Div64,
      --  Divide by 128
      Div128)
     with Size => 3;
   for APBASEL_APBADIVSelect use
     (Div1 => 0,
      Div2 => 1,
      Div4 => 2,
      Div8 => 3,
      Div16 => 4,
      Div32 => 5,
      Div64 => 6,
      Div128 => 7);

   --  APBA Clock Select
   type PM_APBASEL_Register is record
      --  APBA Prescaler Selection
      APBADIV      : APBASEL_APBADIVSelect := Interfaces.SAMD.PM.Div1;
      --  unspecified
      Reserved_3_7 : Interfaces.SAMD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_APBASEL_Register use record
      APBADIV      at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  APBB Prescaler Selection
   type APBBSEL_APBBDIVSelect is
     (--  Divide by 1
      Div1,
      --  Divide by 2
      Div2,
      --  Divide by 4
      Div4,
      --  Divide by 8
      Div8,
      --  Divide by 16
      Div16,
      --  Divide by 32
      Div32,
      --  Divide by 64
      Div64,
      --  Divide by 128
      Div128)
     with Size => 3;
   for APBBSEL_APBBDIVSelect use
     (Div1 => 0,
      Div2 => 1,
      Div4 => 2,
      Div8 => 3,
      Div16 => 4,
      Div32 => 5,
      Div64 => 6,
      Div128 => 7);

   --  APBB Clock Select
   type PM_APBBSEL_Register is record
      --  APBB Prescaler Selection
      APBBDIV      : APBBSEL_APBBDIVSelect := Interfaces.SAMD.PM.Div1;
      --  unspecified
      Reserved_3_7 : Interfaces.SAMD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_APBBSEL_Register use record
      APBBDIV      at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  APBC Prescaler Selection
   type APBCSEL_APBCDIVSelect is
     (--  Divide by 1
      Div1,
      --  Divide by 2
      Div2,
      --  Divide by 4
      Div4,
      --  Divide by 8
      Div8,
      --  Divide by 16
      Div16,
      --  Divide by 32
      Div32,
      --  Divide by 64
      Div64,
      --  Divide by 128
      Div128)
     with Size => 3;
   for APBCSEL_APBCDIVSelect use
     (Div1 => 0,
      Div2 => 1,
      Div4 => 2,
      Div8 => 3,
      Div16 => 4,
      Div32 => 5,
      Div64 => 6,
      Div128 => 7);

   --  APBC Clock Select
   type PM_APBCSEL_Register is record
      --  APBC Prescaler Selection
      APBCDIV      : APBCSEL_APBCDIVSelect := Interfaces.SAMD.PM.Div1;
      --  unspecified
      Reserved_3_7 : Interfaces.SAMD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_APBCSEL_Register use record
      APBCDIV      at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  AHB Mask
   type PM_AHBMASK_Register is record
      --  HPB0 AHB Clock Mask
      HPB0          : Boolean := True;
      --  HPB1 AHB Clock Mask
      HPB1          : Boolean := True;
      --  HPB2 AHB Clock Mask
      HPB2          : Boolean := True;
      --  DSU AHB Clock Mask
      DSU           : Boolean := True;
      --  NVMCTRL AHB Clock Mask
      NVMCTRL       : Boolean := True;
      --  DMAC AHB Clock Mask
      DMAC          : Boolean := True;
      --  USB AHB Clock Mask
      USB           : Boolean := True;
      --  unspecified
      Reserved_7_31 : Interfaces.SAMD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PM_AHBMASK_Register use record
      HPB0          at 0 range 0 .. 0;
      HPB1          at 0 range 1 .. 1;
      HPB2          at 0 range 2 .. 2;
      DSU           at 0 range 3 .. 3;
      NVMCTRL       at 0 range 4 .. 4;
      DMAC          at 0 range 5 .. 5;
      USB           at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  APBA Mask
   type PM_APBAMASK_Register is record
      --  PAC0 APB Clock Enable
      PAC0          : Boolean := True;
      --  PM APB Clock Enable
      PM            : Boolean := True;
      --  SYSCTRL APB Clock Enable
      SYSCTRL       : Boolean := True;
      --  GCLK APB Clock Enable
      GCLK          : Boolean := True;
      --  WDT APB Clock Enable
      WDT           : Boolean := True;
      --  RTC APB Clock Enable
      RTC           : Boolean := True;
      --  EIC APB Clock Enable
      EIC           : Boolean := True;
      --  unspecified
      Reserved_7_31 : Interfaces.SAMD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PM_APBAMASK_Register use record
      PAC0          at 0 range 0 .. 0;
      PM            at 0 range 1 .. 1;
      SYSCTRL       at 0 range 2 .. 2;
      GCLK          at 0 range 3 .. 3;
      WDT           at 0 range 4 .. 4;
      RTC           at 0 range 5 .. 5;
      EIC           at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  APBB Mask
   type PM_APBBMASK_Register is record
      --  PAC1 APB Clock Enable
      PAC1          : Boolean := True;
      --  DSU APB Clock Enable
      DSU           : Boolean := True;
      --  NVMCTRL APB Clock Enable
      NVMCTRL       : Boolean := True;
      --  PORT APB Clock Enable
      PORT          : Boolean := True;
      --  DMAC APB Clock Enable
      DMAC          : Boolean := True;
      --  USB APB Clock Enable
      USB           : Boolean := True;
      --  HMATRIX APB Clock Enable
      HMATRIX       : Boolean := True;
      --  unspecified
      Reserved_7_31 : Interfaces.SAMD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PM_APBBMASK_Register use record
      PAC1          at 0 range 0 .. 0;
      DSU           at 0 range 1 .. 1;
      NVMCTRL       at 0 range 2 .. 2;
      PORT          at 0 range 3 .. 3;
      DMAC          at 0 range 4 .. 4;
      USB           at 0 range 5 .. 5;
      HMATRIX       at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  APBC Mask
   type PM_APBCMASK_Register is record
      --  PAC2 APB Clock Enable
      PAC2           : Boolean := False;
      --  EVSYS APB Clock Enable
      EVSYS          : Boolean := False;
      --  SERCOM0 APB Clock Enable
      SERCOM0        : Boolean := False;
      --  SERCOM1 APB Clock Enable
      SERCOM1        : Boolean := False;
      --  SERCOM2 APB Clock Enable
      SERCOM2        : Boolean := False;
      --  SERCOM3 APB Clock Enable
      SERCOM3        : Boolean := False;
      --  SERCOM4 APB Clock Enable
      SERCOM4        : Boolean := False;
      --  SERCOM5 APB Clock Enable
      SERCOM5        : Boolean := False;
      --  TCC0 APB Clock Enable
      TCC0           : Boolean := False;
      --  TCC1 APB Clock Enable
      TCC1           : Boolean := False;
      --  TCC2 APB Clock Enable
      TCC2           : Boolean := False;
      --  TC3 APB Clock Enable
      TC3            : Boolean := False;
      --  TC4 APB Clock Enable
      TC4            : Boolean := False;
      --  TC5 APB Clock Enable
      TC5            : Boolean := False;
      --  unspecified
      Reserved_14_15 : Interfaces.SAMD.UInt2 := 16#0#;
      --  ADC APB Clock Enable
      ADC            : Boolean := True;
      --  AC APB Clock Enable
      AC             : Boolean := False;
      --  DAC APB Clock Enable
      DAC            : Boolean := False;
      --  PTC APB Clock Enable
      PTC            : Boolean := False;
      --  I2S APB Clock Enable
      I2S            : Boolean := False;
      --  unspecified
      Reserved_21_31 : Interfaces.SAMD.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PM_APBCMASK_Register use record
      PAC2           at 0 range 0 .. 0;
      EVSYS          at 0 range 1 .. 1;
      SERCOM0        at 0 range 2 .. 2;
      SERCOM1        at 0 range 3 .. 3;
      SERCOM2        at 0 range 4 .. 4;
      SERCOM3        at 0 range 5 .. 5;
      SERCOM4        at 0 range 6 .. 6;
      SERCOM5        at 0 range 7 .. 7;
      TCC0           at 0 range 8 .. 8;
      TCC1           at 0 range 9 .. 9;
      TCC2           at 0 range 10 .. 10;
      TC3            at 0 range 11 .. 11;
      TC4            at 0 range 12 .. 12;
      TC5            at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      ADC            at 0 range 16 .. 16;
      AC             at 0 range 17 .. 17;
      DAC            at 0 range 18 .. 18;
      PTC            at 0 range 19 .. 19;
      I2S            at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   --  Interrupt Enable Clear
   type PM_INTENCLR_Register is record
      --  Clock Ready Interrupt Enable
      CKRDY        : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_INTENCLR_Register use record
      CKRDY        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Enable Set
   type PM_INTENSET_Register is record
      --  Clock Ready Interrupt Enable
      CKRDY        : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_INTENSET_Register use record
      CKRDY        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  Interrupt Flag Status and Clear
   type PM_INTFLAG_Register is record
      --  Clock Ready
      CKRDY        : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_INTFLAG_Register use record
      CKRDY        at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  PM_RCAUSE_BOD array
   type PM_RCAUSE_BOD_Field_Array is array (12 .. 13) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PM_RCAUSE_BOD
   type PM_RCAUSE_BOD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BOD as a value
            Val : Interfaces.SAMD.UInt2;
         when True =>
            --  BOD as an array
            Arr : PM_RCAUSE_BOD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PM_RCAUSE_BOD_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Reset Cause
   type PM_RCAUSE_Register is record
      --  Read-only. Power On Reset
      POR          : Boolean;
      --  Read-only. Brown Out 12 Detector Reset
      BOD          : PM_RCAUSE_BOD_Field;
      --  unspecified
      Reserved_3_3 : Interfaces.SAMD.Bit;
      --  Read-only. External Reset
      EXT          : Boolean;
      --  Read-only. Watchdog Reset
      WDT          : Boolean;
      --  Read-only. System Reset Request
      SYST         : Boolean;
      --  unspecified
      Reserved_7_7 : Interfaces.SAMD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for PM_RCAUSE_Register use record
      POR          at 0 range 0 .. 0;
      BOD          at 0 range 1 .. 2;
      Reserved_3_3 at 0 range 3 .. 3;
      EXT          at 0 range 4 .. 4;
      WDT          at 0 range 5 .. 5;
      SYST         at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Power Manager
   type PM_Peripheral is record
      --  Control
      CTRL     : aliased Interfaces.SAMD.Byte;
      --  Sleep Mode
      SLEEP    : aliased PM_SLEEP_Register;
      --  CPU Clock Select
      CPUSEL   : aliased PM_CPUSEL_Register;
      --  APBA Clock Select
      APBASEL  : aliased PM_APBASEL_Register;
      --  APBB Clock Select
      APBBSEL  : aliased PM_APBBSEL_Register;
      --  APBC Clock Select
      APBCSEL  : aliased PM_APBCSEL_Register;
      --  AHB Mask
      AHBMASK  : aliased PM_AHBMASK_Register;
      --  APBA Mask
      APBAMASK : aliased PM_APBAMASK_Register;
      --  APBB Mask
      APBBMASK : aliased PM_APBBMASK_Register;
      --  APBC Mask
      APBCMASK : aliased PM_APBCMASK_Register;
      --  Interrupt Enable Clear
      INTENCLR : aliased PM_INTENCLR_Register;
      --  Interrupt Enable Set
      INTENSET : aliased PM_INTENSET_Register;
      --  Interrupt Flag Status and Clear
      INTFLAG  : aliased PM_INTFLAG_Register;
      --  Reset Cause
      RCAUSE   : aliased PM_RCAUSE_Register;
   end record
     with Volatile;

   for PM_Peripheral use record
      CTRL     at 16#0# range 0 .. 7;
      SLEEP    at 16#1# range 0 .. 7;
      CPUSEL   at 16#8# range 0 .. 7;
      APBASEL  at 16#9# range 0 .. 7;
      APBBSEL  at 16#A# range 0 .. 7;
      APBCSEL  at 16#B# range 0 .. 7;
      AHBMASK  at 16#14# range 0 .. 31;
      APBAMASK at 16#18# range 0 .. 31;
      APBBMASK at 16#1C# range 0 .. 31;
      APBCMASK at 16#20# range 0 .. 31;
      INTENCLR at 16#34# range 0 .. 7;
      INTENSET at 16#35# range 0 .. 7;
      INTFLAG  at 16#36# range 0 .. 7;
      RCAUSE   at 16#38# range 0 .. 7;
   end record;

   --  Power Manager
   PM_Periph : aliased PM_Peripheral
     with Import, Address => PM_Base;

end Interfaces.SAMD.PM;
