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

package Interfaces.SAMD.RTC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   ----------------------------------
   -- RtcMode0 cluster's Registers --
   ----------------------------------

   --  Operating Mode
   type CTRL_MODESelect is
     (--  Mode 0: 32-bit Counter
      Count32,
      --  Mode 1: 16-bit Counter
      Count16,
      --  Mode 2: Clock/Calendar
      Clock)
     with Size => 2;
   for CTRL_MODESelect use
     (Count32 => 0,
      Count16 => 1,
      Clock => 2);

   --  Prescaler
   type CTRL_PRESCALERSelect is
     (--  CLK_RTC_CNT = GCLK_RTC/1
      Div1,
      --  CLK_RTC_CNT = GCLK_RTC/2
      Div2,
      --  CLK_RTC_CNT = GCLK_RTC/4
      Div4,
      --  CLK_RTC_CNT = GCLK_RTC/8
      Div8,
      --  CLK_RTC_CNT = GCLK_RTC/16
      Div16,
      --  CLK_RTC_CNT = GCLK_RTC/32
      Div32,
      --  CLK_RTC_CNT = GCLK_RTC/64
      Div64,
      --  CLK_RTC_CNT = GCLK_RTC/128
      Div128,
      --  CLK_RTC_CNT = GCLK_RTC/256
      Div256,
      --  CLK_RTC_CNT = GCLK_RTC/512
      Div512,
      --  CLK_RTC_CNT = GCLK_RTC/1024
      Div1024)
     with Size => 4;
   for CTRL_PRESCALERSelect use
     (Div1 => 0,
      Div2 => 1,
      Div4 => 2,
      Div8 => 3,
      Div16 => 4,
      Div32 => 5,
      Div64 => 6,
      Div128 => 7,
      Div256 => 8,
      Div512 => 9,
      Div1024 => 10);

   --  MODE0 Control
   type RTC_CTRL_RTC_MODE0_Register is record
      --  Write-only. Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRL_MODESelect := Interfaces.SAMD.RTC.Count32;
      --  unspecified
      Reserved_4_6   : Interfaces.SAMD.UInt3 := 16#0#;
      --  Clear on Match
      MATCHCLR       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRL_PRESCALERSelect := Interfaces.SAMD.RTC.Div1;
      --  unspecified
      Reserved_12_15 : Interfaces.SAMD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRL_RTC_MODE0_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      MATCHCLR       at 0 range 7 .. 7;
      PRESCALER      at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype RTC_READREQ_RTC_MODE0_ADDR_Field is Interfaces.SAMD.UInt6;

   --  Read Request
   type RTC_READREQ_RTC_MODE0_Register is record
      --  Read-only. Address
      ADDR          : RTC_READREQ_RTC_MODE0_ADDR_Field := 16#10#;
      --  unspecified
      Reserved_6_13 : Interfaces.SAMD.Byte := 16#0#;
      --  Read Continuously
      RCONT         : Boolean := False;
      --  Write-only. Read Request
      RREQ          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_READREQ_RTC_MODE0_Register use record
      ADDR          at 0 range 0 .. 5;
      Reserved_6_13 at 0 range 6 .. 13;
      RCONT         at 0 range 14 .. 14;
      RREQ          at 0 range 15 .. 15;
   end record;

   --  RTC_EVCTRL_RTC_MODE0_PEREO array
   type RTC_EVCTRL_RTC_MODE0_PEREO_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_EVCTRL_RTC_MODE0_PEREO
   type RTC_EVCTRL_RTC_MODE0_PEREO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PEREO as a value
            Val : Interfaces.SAMD.Byte;
         when True =>
            --  PEREO as an array
            Arr : RTC_EVCTRL_RTC_MODE0_PEREO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_EVCTRL_RTC_MODE0_PEREO_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  MODE0 Event Control
   type RTC_EVCTRL_RTC_MODE0_Register is record
      --  Periodic Interval 0 Event Output Enable
      PEREO         : RTC_EVCTRL_RTC_MODE0_PEREO_Field :=
                       (As_Array => False, Val => 16#0#);
      --  Compare 0 Event Output Enable
      CMPEO0        : Boolean := False;
      --  unspecified
      Reserved_9_14 : Interfaces.SAMD.UInt6 := 16#0#;
      --  Overflow Event Output Enable
      OVFEO         : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_EVCTRL_RTC_MODE0_Register use record
      PEREO         at 0 range 0 .. 7;
      CMPEO0        at 0 range 8 .. 8;
      Reserved_9_14 at 0 range 9 .. 14;
      OVFEO         at 0 range 15 .. 15;
   end record;

   --  MODE0 Interrupt Enable Clear
   type RTC_INTENCLR_RTC_MODE0_Register is record
      --  Compare 0 Interrupt Enable
      CMP0         : Boolean := False;
      --  unspecified
      Reserved_1_5 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  Overflow Interrupt Enable
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENCLR_RTC_MODE0_Register use record
      CMP0         at 0 range 0 .. 0;
      Reserved_1_5 at 0 range 1 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  MODE0 Interrupt Enable Set
   type RTC_INTENSET_RTC_MODE0_Register is record
      --  Compare 0 Interrupt Enable
      CMP0         : Boolean := False;
      --  unspecified
      Reserved_1_5 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  Overflow Interrupt Enable
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENSET_RTC_MODE0_Register use record
      CMP0         at 0 range 0 .. 0;
      Reserved_1_5 at 0 range 1 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  MODE0 Interrupt Flag Status and Clear
   type RTC_INTFLAG_RTC_MODE0_Register is record
      --  Compare 0
      CMP0         : Boolean := False;
      --  unspecified
      Reserved_1_5 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Synchronization Ready
      SYNCRDY      : Boolean := False;
      --  Overflow
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTFLAG_RTC_MODE0_Register use record
      CMP0         at 0 range 0 .. 0;
      Reserved_1_5 at 0 range 1 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  Status
   type RTC_STATUS_RTC_MODE0_Register is record
      --  unspecified
      Reserved_0_6 : Interfaces.SAMD.UInt7;
      --  Read-only. Synchronization Busy
      SYNCBUSY     : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_STATUS_RTC_MODE0_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      SYNCBUSY     at 0 range 7 .. 7;
   end record;

   --  Debug Control
   type RTC_DBGCTRL_RTC_MODE0_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_DBGCTRL_RTC_MODE0_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   subtype RTC_FREQCORR_RTC_MODE0_VALUE_Field is Interfaces.SAMD.UInt7;

   --  Frequency Correction
   type RTC_FREQCORR_RTC_MODE0_Register is record
      --  Correction Value
      VALUE : RTC_FREQCORR_RTC_MODE0_VALUE_Field := 16#0#;
      --  Correction Sign
      SIGN  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_FREQCORR_RTC_MODE0_Register use record
      VALUE at 0 range 0 .. 6;
      SIGN  at 0 range 7 .. 7;
   end record;

   --  32-bit Counter with Single 32-bit Compare
   type RtcMode0_Cluster is record
      --  MODE0 Control
      CTRL     : aliased RTC_CTRL_RTC_MODE0_Register;
      --  Read Request
      READREQ  : aliased RTC_READREQ_RTC_MODE0_Register;
      --  MODE0 Event Control
      EVCTRL   : aliased RTC_EVCTRL_RTC_MODE0_Register;
      --  MODE0 Interrupt Enable Clear
      INTENCLR : aliased RTC_INTENCLR_RTC_MODE0_Register;
      --  MODE0 Interrupt Enable Set
      INTENSET : aliased RTC_INTENSET_RTC_MODE0_Register;
      --  MODE0 Interrupt Flag Status and Clear
      INTFLAG  : aliased RTC_INTFLAG_RTC_MODE0_Register;
      --  Status
      STATUS   : aliased RTC_STATUS_RTC_MODE0_Register;
      --  Debug Control
      DBGCTRL  : aliased RTC_DBGCTRL_RTC_MODE0_Register;
      --  Frequency Correction
      FREQCORR : aliased RTC_FREQCORR_RTC_MODE0_Register;
      --  MODE0 Counter Value
      COUNT    : aliased Interfaces.SAMD.UInt32;
      --  MODE0 Compare n Value
      COMP     : aliased Interfaces.SAMD.UInt32;
   end record
     with Size => 224;

   for RtcMode0_Cluster use record
      CTRL     at 16#0# range 0 .. 15;
      READREQ  at 16#2# range 0 .. 15;
      EVCTRL   at 16#4# range 0 .. 15;
      INTENCLR at 16#6# range 0 .. 7;
      INTENSET at 16#7# range 0 .. 7;
      INTFLAG  at 16#8# range 0 .. 7;
      STATUS   at 16#A# range 0 .. 7;
      DBGCTRL  at 16#B# range 0 .. 7;
      FREQCORR at 16#C# range 0 .. 7;
      COUNT    at 16#10# range 0 .. 31;
      COMP     at 16#18# range 0 .. 31;
   end record;

   ----------------------------------
   -- RtcMode1 cluster's Registers --
   ----------------------------------

   --  MODE1 Control
   type RTC_CTRL_RTC_MODE1_Register is record
      --  Write-only. Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRL_MODESelect := Interfaces.SAMD.RTC.Count32;
      --  unspecified
      Reserved_4_7   : Interfaces.SAMD.UInt4 := 16#0#;
      --  Prescaler
      PRESCALER      : CTRL_PRESCALERSelect := Interfaces.SAMD.RTC.Div1;
      --  unspecified
      Reserved_12_15 : Interfaces.SAMD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRL_RTC_MODE1_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      PRESCALER      at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype RTC_READREQ_RTC_MODE1_ADDR_Field is Interfaces.SAMD.UInt6;

   --  Read Request
   type RTC_READREQ_RTC_MODE1_Register is record
      --  Read-only. Address
      ADDR          : RTC_READREQ_RTC_MODE1_ADDR_Field := 16#10#;
      --  unspecified
      Reserved_6_13 : Interfaces.SAMD.Byte := 16#0#;
      --  Read Continuously
      RCONT         : Boolean := False;
      --  Write-only. Read Request
      RREQ          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_READREQ_RTC_MODE1_Register use record
      ADDR          at 0 range 0 .. 5;
      Reserved_6_13 at 0 range 6 .. 13;
      RCONT         at 0 range 14 .. 14;
      RREQ          at 0 range 15 .. 15;
   end record;

   --  RTC_EVCTRL_RTC_MODE1_PEREO array
   type RTC_EVCTRL_RTC_MODE1_PEREO_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_EVCTRL_RTC_MODE1_PEREO
   type RTC_EVCTRL_RTC_MODE1_PEREO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PEREO as a value
            Val : Interfaces.SAMD.Byte;
         when True =>
            --  PEREO as an array
            Arr : RTC_EVCTRL_RTC_MODE1_PEREO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_EVCTRL_RTC_MODE1_PEREO_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  RTC_EVCTRL_RTC_MODE1_CMPEO array
   type RTC_EVCTRL_RTC_MODE1_CMPEO_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_EVCTRL_RTC_MODE1_CMPEO
   type RTC_EVCTRL_RTC_MODE1_CMPEO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMPEO as a value
            Val : Interfaces.SAMD.UInt2;
         when True =>
            --  CMPEO as an array
            Arr : RTC_EVCTRL_RTC_MODE1_CMPEO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_EVCTRL_RTC_MODE1_CMPEO_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE1 Event Control
   type RTC_EVCTRL_RTC_MODE1_Register is record
      --  Periodic Interval 0 Event Output Enable
      PEREO          : RTC_EVCTRL_RTC_MODE1_PEREO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  Compare 0 Event Output Enable
      CMPEO          : RTC_EVCTRL_RTC_MODE1_CMPEO_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_14 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Overflow Event Output Enable
      OVFEO          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_EVCTRL_RTC_MODE1_Register use record
      PEREO          at 0 range 0 .. 7;
      CMPEO          at 0 range 8 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      OVFEO          at 0 range 15 .. 15;
   end record;

   --  RTC_INTENCLR_RTC_MODE1_CMP array
   type RTC_INTENCLR_RTC_MODE1_CMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTENCLR_RTC_MODE1_CMP
   type RTC_INTENCLR_RTC_MODE1_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : Interfaces.SAMD.UInt2;
         when True =>
            --  CMP as an array
            Arr : RTC_INTENCLR_RTC_MODE1_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTENCLR_RTC_MODE1_CMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE1 Interrupt Enable Clear
   type RTC_INTENCLR_RTC_MODE1_Register is record
      --  Compare 0 Interrupt Enable
      CMP          : RTC_INTENCLR_RTC_MODE1_CMP_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_5 : Interfaces.SAMD.UInt4 := 16#0#;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  Overflow Interrupt Enable
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENCLR_RTC_MODE1_Register use record
      CMP          at 0 range 0 .. 1;
      Reserved_2_5 at 0 range 2 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  RTC_INTENSET_RTC_MODE1_CMP array
   type RTC_INTENSET_RTC_MODE1_CMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTENSET_RTC_MODE1_CMP
   type RTC_INTENSET_RTC_MODE1_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : Interfaces.SAMD.UInt2;
         when True =>
            --  CMP as an array
            Arr : RTC_INTENSET_RTC_MODE1_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTENSET_RTC_MODE1_CMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE1 Interrupt Enable Set
   type RTC_INTENSET_RTC_MODE1_Register is record
      --  Compare 0 Interrupt Enable
      CMP          : RTC_INTENSET_RTC_MODE1_CMP_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_5 : Interfaces.SAMD.UInt4 := 16#0#;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  Overflow Interrupt Enable
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENSET_RTC_MODE1_Register use record
      CMP          at 0 range 0 .. 1;
      Reserved_2_5 at 0 range 2 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  RTC_INTFLAG_RTC_MODE1_CMP array
   type RTC_INTFLAG_RTC_MODE1_CMP_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for RTC_INTFLAG_RTC_MODE1_CMP
   type RTC_INTFLAG_RTC_MODE1_CMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CMP as a value
            Val : Interfaces.SAMD.UInt2;
         when True =>
            --  CMP as an array
            Arr : RTC_INTFLAG_RTC_MODE1_CMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTC_INTFLAG_RTC_MODE1_CMP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  MODE1 Interrupt Flag Status and Clear
   type RTC_INTFLAG_RTC_MODE1_Register is record
      --  Compare 0
      CMP          : RTC_INTFLAG_RTC_MODE1_CMP_Field :=
                      (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_5 : Interfaces.SAMD.UInt4 := 16#0#;
      --  Synchronization Ready
      SYNCRDY      : Boolean := False;
      --  Overflow
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTFLAG_RTC_MODE1_Register use record
      CMP          at 0 range 0 .. 1;
      Reserved_2_5 at 0 range 2 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  Status
   type RTC_STATUS_RTC_MODE1_Register is record
      --  unspecified
      Reserved_0_6 : Interfaces.SAMD.UInt7;
      --  Read-only. Synchronization Busy
      SYNCBUSY     : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_STATUS_RTC_MODE1_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      SYNCBUSY     at 0 range 7 .. 7;
   end record;

   --  Debug Control
   type RTC_DBGCTRL_RTC_MODE1_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_DBGCTRL_RTC_MODE1_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   subtype RTC_FREQCORR_RTC_MODE1_VALUE_Field is Interfaces.SAMD.UInt7;

   --  Frequency Correction
   type RTC_FREQCORR_RTC_MODE1_Register is record
      --  Correction Value
      VALUE : RTC_FREQCORR_RTC_MODE1_VALUE_Field := 16#0#;
      --  Correction Sign
      SIGN  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_FREQCORR_RTC_MODE1_Register use record
      VALUE at 0 range 0 .. 6;
      SIGN  at 0 range 7 .. 7;
   end record;

   --  MODE1 Compare n Value

   --  MODE1 Compare n Value
   type RTC_COMP_RTC_MODE1_Registers is array (0 .. 1)
     of Interfaces.SAMD.UInt16;

   --  16-bit Counter with Two 16-bit Compares
   type RtcMode1_Cluster is record
      --  MODE1 Control
      CTRL     : aliased RTC_CTRL_RTC_MODE1_Register;
      --  Read Request
      READREQ  : aliased RTC_READREQ_RTC_MODE1_Register;
      --  MODE1 Event Control
      EVCTRL   : aliased RTC_EVCTRL_RTC_MODE1_Register;
      --  MODE1 Interrupt Enable Clear
      INTENCLR : aliased RTC_INTENCLR_RTC_MODE1_Register;
      --  MODE1 Interrupt Enable Set
      INTENSET : aliased RTC_INTENSET_RTC_MODE1_Register;
      --  MODE1 Interrupt Flag Status and Clear
      INTFLAG  : aliased RTC_INTFLAG_RTC_MODE1_Register;
      --  Status
      STATUS   : aliased RTC_STATUS_RTC_MODE1_Register;
      --  Debug Control
      DBGCTRL  : aliased RTC_DBGCTRL_RTC_MODE1_Register;
      --  Frequency Correction
      FREQCORR : aliased RTC_FREQCORR_RTC_MODE1_Register;
      --  MODE1 Counter Value
      COUNT    : aliased Interfaces.SAMD.UInt16;
      --  MODE1 Counter Period
      PER      : aliased Interfaces.SAMD.UInt16;
      --  MODE1 Compare n Value
      COMP     : aliased RTC_COMP_RTC_MODE1_Registers;
   end record
     with Size => 224;

   for RtcMode1_Cluster use record
      CTRL     at 16#0# range 0 .. 15;
      READREQ  at 16#2# range 0 .. 15;
      EVCTRL   at 16#4# range 0 .. 15;
      INTENCLR at 16#6# range 0 .. 7;
      INTENSET at 16#7# range 0 .. 7;
      INTFLAG  at 16#8# range 0 .. 7;
      STATUS   at 16#A# range 0 .. 7;
      DBGCTRL  at 16#B# range 0 .. 7;
      FREQCORR at 16#C# range 0 .. 7;
      COUNT    at 16#10# range 0 .. 15;
      PER      at 16#14# range 0 .. 15;
      COMP     at 16#18# range 0 .. 31;
   end record;

   ----------------------------------
   -- RtcMode2 cluster's Registers --
   ----------------------------------

   --  MODE2 Control
   type RTC_CTRL_RTC_MODE2_Register is record
      --  Write-only. Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRL_MODESelect := Interfaces.SAMD.RTC.Count32;
      --  unspecified
      Reserved_4_5   : Interfaces.SAMD.UInt2 := 16#0#;
      --  Clock Representation
      CLKREP         : Boolean := False;
      --  Clear on Match
      MATCHCLR       : Boolean := False;
      --  Prescaler
      PRESCALER      : CTRL_PRESCALERSelect := Interfaces.SAMD.RTC.Div1;
      --  unspecified
      Reserved_12_15 : Interfaces.SAMD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_CTRL_RTC_MODE2_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      CLKREP         at 0 range 6 .. 6;
      MATCHCLR       at 0 range 7 .. 7;
      PRESCALER      at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   subtype RTC_READREQ_RTC_MODE2_ADDR_Field is Interfaces.SAMD.UInt6;

   --  Read Request
   type RTC_READREQ_RTC_MODE2_Register is record
      --  Read-only. Address
      ADDR          : RTC_READREQ_RTC_MODE2_ADDR_Field := 16#10#;
      --  unspecified
      Reserved_6_13 : Interfaces.SAMD.Byte := 16#0#;
      --  Read Continuously
      RCONT         : Boolean := False;
      --  Write-only. Read Request
      RREQ          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_READREQ_RTC_MODE2_Register use record
      ADDR          at 0 range 0 .. 5;
      Reserved_6_13 at 0 range 6 .. 13;
      RCONT         at 0 range 14 .. 14;
      RREQ          at 0 range 15 .. 15;
   end record;

   --  RTC_EVCTRL_RTC_MODE2_PEREO array
   type RTC_EVCTRL_RTC_MODE2_PEREO_Field_Array is array (0 .. 7) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RTC_EVCTRL_RTC_MODE2_PEREO
   type RTC_EVCTRL_RTC_MODE2_PEREO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PEREO as a value
            Val : Interfaces.SAMD.Byte;
         when True =>
            --  PEREO as an array
            Arr : RTC_EVCTRL_RTC_MODE2_PEREO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RTC_EVCTRL_RTC_MODE2_PEREO_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  MODE2 Event Control
   type RTC_EVCTRL_RTC_MODE2_Register is record
      --  Periodic Interval 0 Event Output Enable
      PEREO         : RTC_EVCTRL_RTC_MODE2_PEREO_Field :=
                       (As_Array => False, Val => 16#0#);
      --  Alarm 0 Event Output Enable
      ALARMEO0      : Boolean := False;
      --  unspecified
      Reserved_9_14 : Interfaces.SAMD.UInt6 := 16#0#;
      --  Overflow Event Output Enable
      OVFEO         : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RTC_EVCTRL_RTC_MODE2_Register use record
      PEREO         at 0 range 0 .. 7;
      ALARMEO0      at 0 range 8 .. 8;
      Reserved_9_14 at 0 range 9 .. 14;
      OVFEO         at 0 range 15 .. 15;
   end record;

   --  MODE2 Interrupt Enable Clear
   type RTC_INTENCLR_RTC_MODE2_Register is record
      --  Alarm 0 Interrupt Enable
      ALARM0       : Boolean := False;
      --  unspecified
      Reserved_1_5 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  Overflow Interrupt Enable
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENCLR_RTC_MODE2_Register use record
      ALARM0       at 0 range 0 .. 0;
      Reserved_1_5 at 0 range 1 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  MODE2 Interrupt Enable Set
   type RTC_INTENSET_RTC_MODE2_Register is record
      --  Alarm 0 Interrupt Enable
      ALARM0       : Boolean := False;
      --  unspecified
      Reserved_1_5 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Synchronization Ready Interrupt Enable
      SYNCRDY      : Boolean := False;
      --  Overflow Interrupt Enable
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTENSET_RTC_MODE2_Register use record
      ALARM0       at 0 range 0 .. 0;
      Reserved_1_5 at 0 range 1 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  MODE2 Interrupt Flag Status and Clear
   type RTC_INTFLAG_RTC_MODE2_Register is record
      --  Alarm 0
      ALARM0       : Boolean := False;
      --  unspecified
      Reserved_1_5 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Synchronization Ready
      SYNCRDY      : Boolean := False;
      --  Overflow
      OVF          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_INTFLAG_RTC_MODE2_Register use record
      ALARM0       at 0 range 0 .. 0;
      Reserved_1_5 at 0 range 1 .. 5;
      SYNCRDY      at 0 range 6 .. 6;
      OVF          at 0 range 7 .. 7;
   end record;

   --  Status
   type RTC_STATUS_RTC_MODE2_Register is record
      --  unspecified
      Reserved_0_6 : Interfaces.SAMD.UInt7;
      --  Read-only. Synchronization Busy
      SYNCBUSY     : Boolean;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_STATUS_RTC_MODE2_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      SYNCBUSY     at 0 range 7 .. 7;
   end record;

   --  Debug Control
   type RTC_DBGCTRL_RTC_MODE2_Register is record
      --  Run During Debug
      DBGRUN       : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_DBGCTRL_RTC_MODE2_Register use record
      DBGRUN       at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   subtype RTC_FREQCORR_RTC_MODE2_VALUE_Field is Interfaces.SAMD.UInt7;

   --  Frequency Correction
   type RTC_FREQCORR_RTC_MODE2_Register is record
      --  Correction Value
      VALUE : RTC_FREQCORR_RTC_MODE2_VALUE_Field := 16#0#;
      --  Correction Sign
      SIGN  : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_FREQCORR_RTC_MODE2_Register use record
      VALUE at 0 range 0 .. 6;
      SIGN  at 0 range 7 .. 7;
   end record;

   subtype RTC_CLOCK_RTC_MODE2_SECOND_Field is Interfaces.SAMD.UInt6;
   subtype RTC_CLOCK_RTC_MODE2_MINUTE_Field is Interfaces.SAMD.UInt6;

   --  Hour
   type CLOCK_HOURSelect is
     (--  AM when CLKREP in 12-hour
      Am,
      --  PM when CLKREP in 12-hour
      Pm)
     with Size => 5;
   for CLOCK_HOURSelect use
     (Am => 0,
      Pm => 16);

   subtype RTC_CLOCK_RTC_MODE2_DAY_Field is Interfaces.SAMD.UInt5;
   subtype RTC_CLOCK_RTC_MODE2_MONTH_Field is Interfaces.SAMD.UInt4;
   subtype RTC_CLOCK_RTC_MODE2_YEAR_Field is Interfaces.SAMD.UInt6;

   --  MODE2 Clock Value
   type RTC_CLOCK_RTC_MODE2_Register is record
      --  Second
      SECOND : RTC_CLOCK_RTC_MODE2_SECOND_Field := 16#0#;
      --  Minute
      MINUTE : RTC_CLOCK_RTC_MODE2_MINUTE_Field := 16#0#;
      --  Hour
      HOUR   : CLOCK_HOURSelect := Interfaces.SAMD.RTC.Am;
      --  Day
      DAY    : RTC_CLOCK_RTC_MODE2_DAY_Field := 16#0#;
      --  Month
      MONTH  : RTC_CLOCK_RTC_MODE2_MONTH_Field := 16#0#;
      --  Year
      YEAR   : RTC_CLOCK_RTC_MODE2_YEAR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_CLOCK_RTC_MODE2_Register use record
      SECOND at 0 range 0 .. 5;
      MINUTE at 0 range 6 .. 11;
      HOUR   at 0 range 12 .. 16;
      DAY    at 0 range 17 .. 21;
      MONTH  at 0 range 22 .. 25;
      YEAR   at 0 range 26 .. 31;
   end record;

   subtype RTC_ALARM_RTC_MODE2_SECOND_Field is Interfaces.SAMD.UInt6;
   subtype RTC_ALARM_RTC_MODE2_MINUTE_Field is Interfaces.SAMD.UInt6;

   --  Hour
   type ALARM_HOURSelect is
     (--  Morning hour
      Am,
      --  Afternoon hour
      Pm)
     with Size => 5;
   for ALARM_HOURSelect use
     (Am => 0,
      Pm => 16);

   subtype RTC_ALARM_RTC_MODE2_DAY_Field is Interfaces.SAMD.UInt5;
   subtype RTC_ALARM_RTC_MODE2_MONTH_Field is Interfaces.SAMD.UInt4;
   subtype RTC_ALARM_RTC_MODE2_YEAR_Field is Interfaces.SAMD.UInt6;

   --  MODE2 Alarm n Value
   type RTC_ALARM_RTC_MODE2_Register is record
      --  Second
      SECOND : RTC_ALARM_RTC_MODE2_SECOND_Field := 16#0#;
      --  Minute
      MINUTE : RTC_ALARM_RTC_MODE2_MINUTE_Field := 16#0#;
      --  Hour
      HOUR   : ALARM_HOURSelect := Interfaces.SAMD.RTC.Am;
      --  Day
      DAY    : RTC_ALARM_RTC_MODE2_DAY_Field := 16#0#;
      --  Month
      MONTH  : RTC_ALARM_RTC_MODE2_MONTH_Field := 16#0#;
      --  Year
      YEAR   : RTC_ALARM_RTC_MODE2_YEAR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTC_ALARM_RTC_MODE2_Register use record
      SECOND at 0 range 0 .. 5;
      MINUTE at 0 range 6 .. 11;
      HOUR   at 0 range 12 .. 16;
      DAY    at 0 range 17 .. 21;
      MONTH  at 0 range 22 .. 25;
      YEAR   at 0 range 26 .. 31;
   end record;

   --  Alarm Mask Selection
   type MASK_SELSelect is
     (--  Alarm Disabled
      Off,
      --  Match seconds only
      Ss,
      --  Match seconds and minutes only
      Mmss,
      --  Match seconds, minutes, and hours only
      Hhmmss,
      --  Match seconds, minutes, hours, and days only
      Ddhhmmss,
      --  Match seconds, minutes, hours, days, and months only
      Mmddhhmmss,
      --  Match seconds, minutes, hours, days, months, and years
      Yymmddhhmmss)
     with Size => 3;
   for MASK_SELSelect use
     (Off => 0,
      Ss => 1,
      Mmss => 2,
      Hhmmss => 3,
      Ddhhmmss => 4,
      Mmddhhmmss => 5,
      Yymmddhhmmss => 6);

   --  MODE2 Alarm n Mask
   type RTC_MASK_RTC_MODE2_Register is record
      --  Alarm Mask Selection
      SEL          : MASK_SELSelect := Interfaces.SAMD.RTC.Off;
      --  unspecified
      Reserved_3_7 : Interfaces.SAMD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for RTC_MASK_RTC_MODE2_Register use record
      SEL          at 0 range 0 .. 2;
      Reserved_3_7 at 0 range 3 .. 7;
   end record;

   --  Clock/Calendar with Alarm
   type RtcMode2_Cluster is record
      --  MODE2 Control
      CTRL     : aliased RTC_CTRL_RTC_MODE2_Register;
      --  Read Request
      READREQ  : aliased RTC_READREQ_RTC_MODE2_Register;
      --  MODE2 Event Control
      EVCTRL   : aliased RTC_EVCTRL_RTC_MODE2_Register;
      --  MODE2 Interrupt Enable Clear
      INTENCLR : aliased RTC_INTENCLR_RTC_MODE2_Register;
      --  MODE2 Interrupt Enable Set
      INTENSET : aliased RTC_INTENSET_RTC_MODE2_Register;
      --  MODE2 Interrupt Flag Status and Clear
      INTFLAG  : aliased RTC_INTFLAG_RTC_MODE2_Register;
      --  Status
      STATUS   : aliased RTC_STATUS_RTC_MODE2_Register;
      --  Debug Control
      DBGCTRL  : aliased RTC_DBGCTRL_RTC_MODE2_Register;
      --  Frequency Correction
      FREQCORR : aliased RTC_FREQCORR_RTC_MODE2_Register;
      --  MODE2 Clock Value
      CLOCK    : aliased RTC_CLOCK_RTC_MODE2_Register;
      --  MODE2 Alarm n Value
      ALARM    : aliased RTC_ALARM_RTC_MODE2_Register;
      --  MODE2 Alarm n Mask
      MASK     : aliased RTC_MASK_RTC_MODE2_Register;
   end record
     with Size => 256;

   for RtcMode2_Cluster use record
      CTRL     at 16#0# range 0 .. 15;
      READREQ  at 16#2# range 0 .. 15;
      EVCTRL   at 16#4# range 0 .. 15;
      INTENCLR at 16#6# range 0 .. 7;
      INTENSET at 16#7# range 0 .. 7;
      INTFLAG  at 16#8# range 0 .. 7;
      STATUS   at 16#A# range 0 .. 7;
      DBGCTRL  at 16#B# range 0 .. 7;
      FREQCORR at 16#C# range 0 .. 7;
      CLOCK    at 16#10# range 0 .. 31;
      ALARM    at 16#18# range 0 .. 31;
      MASK     at 16#1C# range 0 .. 7;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type RTC_Disc is
     (Val_0,
      Val_1,
      Val_2);

   --  Real-Time Counter
   type RTC_Peripheral
     (Discriminent : RTC_Disc := Val_0)
   is record
      case Discriminent is
         when Val_0 =>
            --  32-bit Counter with Single 32-bit Compare
            RTC_MODE0 : aliased RtcMode0_Cluster;
         when Val_1 =>
            --  16-bit Counter with Two 16-bit Compares
            RTC_MODE1 : aliased RtcMode1_Cluster;
         when Val_2 =>
            --  Clock/Calendar with Alarm
            RTC_MODE2 : aliased RtcMode2_Cluster;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for RTC_Peripheral use record
      RTC_MODE0 at 0 range 0 .. 223;
      RTC_MODE1 at 0 range 0 .. 223;
      RTC_MODE2 at 0 range 0 .. 255;
   end record;

   --  Real-Time Counter
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

end Interfaces.SAMD.RTC;
