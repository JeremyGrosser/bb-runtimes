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

package Interfaces.SAMD.MTB is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype MTB_POSITION_POINTER_Field is Interfaces.SAMD.UInt29;

   --  MTB Position
   type MTB_POSITION_Register is record
      --  unspecified
      Reserved_0_1 : Interfaces.SAMD.UInt2 := 16#0#;
      --  Pointer Value Wraps
      WRAP         : Boolean := False;
      --  Trace Packet Location Pointer
      POINTER      : MTB_POSITION_POINTER_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MTB_POSITION_Register use record
      Reserved_0_1 at 0 range 0 .. 1;
      WRAP         at 0 range 2 .. 2;
      POINTER      at 0 range 3 .. 31;
   end record;

   subtype MTB_MASTER_MASK_Field is Interfaces.SAMD.UInt5;

   --  MTB Master
   type MTB_MASTER_Register is record
      --  Maximum Value of the Trace Buffer in SRAM
      MASK           : MTB_MASTER_MASK_Field := 16#0#;
      --  Trace Start Input Enable
      TSTARTEN       : Boolean := False;
      --  Trace Stop Input Enable
      TSTOPEN        : Boolean := False;
      --  Special Function Register Write Privilege
      SFRWPRIV       : Boolean := False;
      --  SRAM Privilege
      RAMPRIV        : Boolean := False;
      --  Halt Request
      HALTREQ        : Boolean := False;
      --  unspecified
      Reserved_10_30 : Interfaces.SAMD.UInt21 := 16#0#;
      --  Main Trace Enable
      EN             : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MTB_MASTER_Register use record
      MASK           at 0 range 0 .. 4;
      TSTARTEN       at 0 range 5 .. 5;
      TSTOPEN        at 0 range 6 .. 6;
      SFRWPRIV       at 0 range 7 .. 7;
      RAMPRIV        at 0 range 8 .. 8;
      HALTREQ        at 0 range 9 .. 9;
      Reserved_10_30 at 0 range 10 .. 30;
      EN             at 0 range 31 .. 31;
   end record;

   subtype MTB_FLOW_WATERMARK_Field is Interfaces.SAMD.UInt29;

   --  MTB Flow
   type MTB_FLOW_Register is record
      --  Auto Stop Tracing
      AUTOSTOP     : Boolean := False;
      --  Auto Halt Request
      AUTOHALT     : Boolean := False;
      --  unspecified
      Reserved_2_2 : Interfaces.SAMD.Bit := 16#0#;
      --  Watermark value
      WATERMARK    : MTB_FLOW_WATERMARK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MTB_FLOW_Register use record
      AUTOSTOP     at 0 range 0 .. 0;
      AUTOHALT     at 0 range 1 .. 1;
      Reserved_2_2 at 0 range 2 .. 2;
      WATERMARK    at 0 range 3 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Cortex-M0+ Micro-Trace Buffer
   type MTB_Peripheral is record
      --  MTB Position
      POSITION   : aliased MTB_POSITION_Register;
      --  MTB Master
      MASTER     : aliased MTB_MASTER_Register;
      --  MTB Flow
      FLOW       : aliased MTB_FLOW_Register;
      --  MTB Base
      BASE       : aliased Interfaces.SAMD.UInt32;
      --  MTB Integration Mode Control
      ITCTRL     : aliased Interfaces.SAMD.UInt32;
      --  MTB Claim Set
      CLAIMSET   : aliased Interfaces.SAMD.UInt32;
      --  MTB Claim Clear
      CLAIMCLR   : aliased Interfaces.SAMD.UInt32;
      --  MTB Lock Access
      LOCKACCESS : aliased Interfaces.SAMD.UInt32;
      --  MTB Lock Status
      LOCKSTATUS : aliased Interfaces.SAMD.UInt32;
      --  MTB Authentication Status
      AUTHSTATUS : aliased Interfaces.SAMD.UInt32;
      --  MTB Device Architecture
      DEVARCH    : aliased Interfaces.SAMD.UInt32;
      --  MTB Device Configuration
      DEVID      : aliased Interfaces.SAMD.UInt32;
      --  MTB Device Type
      DEVTYPE    : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      PID4       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      PID5       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      PID6       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      PID7       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      PID0       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      PID1       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      PID2       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      PID3       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      CID0       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      CID1       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      CID2       : aliased Interfaces.SAMD.UInt32;
      --  CoreSight
      CID3       : aliased Interfaces.SAMD.UInt32;
   end record
     with Volatile;

   for MTB_Peripheral use record
      POSITION   at 16#0# range 0 .. 31;
      MASTER     at 16#4# range 0 .. 31;
      FLOW       at 16#8# range 0 .. 31;
      BASE       at 16#C# range 0 .. 31;
      ITCTRL     at 16#F00# range 0 .. 31;
      CLAIMSET   at 16#FA0# range 0 .. 31;
      CLAIMCLR   at 16#FA4# range 0 .. 31;
      LOCKACCESS at 16#FB0# range 0 .. 31;
      LOCKSTATUS at 16#FB4# range 0 .. 31;
      AUTHSTATUS at 16#FB8# range 0 .. 31;
      DEVARCH    at 16#FBC# range 0 .. 31;
      DEVID      at 16#FC8# range 0 .. 31;
      DEVTYPE    at 16#FCC# range 0 .. 31;
      PID4       at 16#FD0# range 0 .. 31;
      PID5       at 16#FD4# range 0 .. 31;
      PID6       at 16#FD8# range 0 .. 31;
      PID7       at 16#FDC# range 0 .. 31;
      PID0       at 16#FE0# range 0 .. 31;
      PID1       at 16#FE4# range 0 .. 31;
      PID2       at 16#FE8# range 0 .. 31;
      PID3       at 16#FEC# range 0 .. 31;
      CID0       at 16#FF0# range 0 .. 31;
      CID1       at 16#FF4# range 0 .. 31;
      CID2       at 16#FF8# range 0 .. 31;
      CID3       at 16#FFC# range 0 .. 31;
   end record;

   --  Cortex-M0+ Micro-Trace Buffer
   MTB_Periph : aliased MTB_Peripheral
     with Import, Address => MTB_Base;

end Interfaces.SAMD.MTB;
