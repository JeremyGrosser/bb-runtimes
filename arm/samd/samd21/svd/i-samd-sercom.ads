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
pragma Warnings (Off, "288 bits of ""SercomUsart_Cluster""*");

with System;

package Interfaces.SAMD.SERCOM is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   --  Operating Mode
   type CTRLA_MODESelect is
     (--  USART mode with external clock
      Usart_Ext_Clk,
      --  USART mode with internal clock
      Usart_Int_Clk,
      --  SPI mode with external clock
      Spi_Slave,
      --  SPI mode with internal clock
      Spi_Master,
      --  I2C mode with external clock
      I2C_Slave,
      --  I2C mode with internal clock
      I2C_Master)
     with Size => 3;
   for CTRLA_MODESelect use
     (Usart_Ext_Clk => 0,
      Usart_Int_Clk => 1,
      Spi_Slave => 2,
      Spi_Master => 3,
      I2C_Slave => 4,
      I2C_Master => 5);

   subtype SERCOM_CTRLA_SERCOM_I2CM_SDAHOLD_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLA_SERCOM_I2CM_SPEED_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLA_SERCOM_I2CM_INACTOUT_Field is Interfaces.SAMD.UInt2;

   --  I2CM Control A
   type SERCOM_CTRLA_SERCOM_I2CM_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect :=
                        Interfaces.SAMD.SERCOM.Usart_Ext_Clk;
      --  unspecified
      Reserved_5_6   : Interfaces.SAMD.UInt2 := 16#0#;
      --  Run in Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_8_15  : Interfaces.SAMD.Byte := 16#0#;
      --  Pin Usage
      PINOUT         : Boolean := False;
      --  unspecified
      Reserved_17_19 : Interfaces.SAMD.UInt3 := 16#0#;
      --  SDA Hold Time
      SDAHOLD        : SERCOM_CTRLA_SERCOM_I2CM_SDAHOLD_Field := 16#0#;
      --  Master SCL Low Extend Timeout
      MEXTTOEN       : Boolean := False;
      --  Slave SCL Low Extend Timeout
      SEXTTOEN       : Boolean := False;
      --  Transfer Speed
      SPEED          : SERCOM_CTRLA_SERCOM_I2CM_SPEED_Field := 16#0#;
      --  unspecified
      Reserved_26_26 : Interfaces.SAMD.Bit := 16#0#;
      --  SCL Clock Stretch Mode
      SCLSM          : Boolean := False;
      --  Inactive Time-Out
      INACTOUT       : SERCOM_CTRLA_SERCOM_I2CM_INACTOUT_Field := 16#0#;
      --  SCL Low Timeout Enable
      LOWTOUTEN      : Boolean := False;
      --  unspecified
      Reserved_31_31 : Interfaces.SAMD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_I2CM_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      PINOUT         at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      SDAHOLD        at 0 range 20 .. 21;
      MEXTTOEN       at 0 range 22 .. 22;
      SEXTTOEN       at 0 range 23 .. 23;
      SPEED          at 0 range 24 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      SCLSM          at 0 range 27 .. 27;
      INACTOUT       at 0 range 28 .. 29;
      LOWTOUTEN      at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype SERCOM_CTRLB_SERCOM_I2CM_CMD_Field is Interfaces.SAMD.UInt2;

   --  I2CM Control B
   type SERCOM_CTRLB_SERCOM_I2CM_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.SAMD.Byte := 16#0#;
      --  Smart Mode Enable
      SMEN           : Boolean := False;
      --  Quick Command Enable
      QCEN           : Boolean := False;
      --  unspecified
      Reserved_10_15 : Interfaces.SAMD.UInt6 := 16#0#;
      --  Write-only. Command
      CMD            : SERCOM_CTRLB_SERCOM_I2CM_CMD_Field := 16#0#;
      --  Acknowledge Action
      ACKACT         : Boolean := False;
      --  unspecified
      Reserved_19_31 : Interfaces.SAMD.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_I2CM_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      SMEN           at 0 range 8 .. 8;
      QCEN           at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      CMD            at 0 range 16 .. 17;
      ACKACT         at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype SERCOM_BAUD_SERCOM_I2CM_BAUD_Field is Interfaces.SAMD.Byte;
   subtype SERCOM_BAUD_SERCOM_I2CM_BAUDLOW_Field is Interfaces.SAMD.Byte;
   subtype SERCOM_BAUD_SERCOM_I2CM_HSBAUD_Field is Interfaces.SAMD.Byte;
   subtype SERCOM_BAUD_SERCOM_I2CM_HSBAUDLOW_Field is Interfaces.SAMD.Byte;

   --  I2CM Baud Rate
   type SERCOM_BAUD_SERCOM_I2CM_Register is record
      --  Baud Rate Value
      BAUD      : SERCOM_BAUD_SERCOM_I2CM_BAUD_Field := 16#0#;
      --  Baud Rate Value Low
      BAUDLOW   : SERCOM_BAUD_SERCOM_I2CM_BAUDLOW_Field := 16#0#;
      --  High Speed Baud Rate Value
      HSBAUD    : SERCOM_BAUD_SERCOM_I2CM_HSBAUD_Field := 16#0#;
      --  High Speed Baud Rate Value Low
      HSBAUDLOW : SERCOM_BAUD_SERCOM_I2CM_HSBAUDLOW_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_BAUD_SERCOM_I2CM_Register use record
      BAUD      at 0 range 0 .. 7;
      BAUDLOW   at 0 range 8 .. 15;
      HSBAUD    at 0 range 16 .. 23;
      HSBAUDLOW at 0 range 24 .. 31;
   end record;

   --  I2CM Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_I2CM_Register is record
      --  Master On Bus Interrupt Disable
      MB           : Boolean := False;
      --  Slave On Bus Interrupt Disable
      SB           : Boolean := False;
      --  unspecified
      Reserved_2_6 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_I2CM_Register use record
      MB           at 0 range 0 .. 0;
      SB           at 0 range 1 .. 1;
      Reserved_2_6 at 0 range 2 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CM Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_I2CM_Register is record
      --  Master On Bus Interrupt Enable
      MB           : Boolean := False;
      --  Slave On Bus Interrupt Enable
      SB           : Boolean := False;
      --  unspecified
      Reserved_2_6 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_I2CM_Register use record
      MB           at 0 range 0 .. 0;
      SB           at 0 range 1 .. 1;
      Reserved_2_6 at 0 range 2 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CM Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_I2CM_Register is record
      --  Master On Bus Interrupt
      MB           : Boolean := False;
      --  Slave On Bus Interrupt
      SB           : Boolean := False;
      --  unspecified
      Reserved_2_6 : Interfaces.SAMD.UInt5 := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_I2CM_Register use record
      MB           at 0 range 0 .. 0;
      SB           at 0 range 1 .. 1;
      Reserved_2_6 at 0 range 2 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   subtype SERCOM_STATUS_SERCOM_I2CM_BUSSTATE_Field is Interfaces.SAMD.UInt2;

   --  I2CM Status
   type SERCOM_STATUS_SERCOM_I2CM_Register is record
      --  Bus Error
      BUSERR         : Boolean := False;
      --  Arbitration Lost
      ARBLOST        : Boolean := False;
      --  Read-only. Received Not Acknowledge
      RXNACK         : Boolean := False;
      --  unspecified
      Reserved_3_3   : Interfaces.SAMD.Bit := 16#0#;
      --  Bus State
      BUSSTATE       : SERCOM_STATUS_SERCOM_I2CM_BUSSTATE_Field := 16#0#;
      --  SCL Low Timeout
      LOWTOUT        : Boolean := False;
      --  Read-only. Clock Hold
      CLKHOLD        : Boolean := False;
      --  Master SCL Low Extend Timeout
      MEXTTOUT       : Boolean := False;
      --  Slave SCL Low Extend Timeout
      SEXTTOUT       : Boolean := False;
      --  Length Error
      LENERR         : Boolean := False;
      --  unspecified
      Reserved_11_15 : Interfaces.SAMD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_I2CM_Register use record
      BUSERR         at 0 range 0 .. 0;
      ARBLOST        at 0 range 1 .. 1;
      RXNACK         at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      BUSSTATE       at 0 range 4 .. 5;
      LOWTOUT        at 0 range 6 .. 6;
      CLKHOLD        at 0 range 7 .. 7;
      MEXTTOUT       at 0 range 8 .. 8;
      SEXTTOUT       at 0 range 9 .. 9;
      LENERR         at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  I2CM Syncbusy
   type SERCOM_SYNCBUSY_SERCOM_I2CM_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. System Operation Synchronization Busy
      SYSOP         : Boolean;
      --  unspecified
      Reserved_3_31 : Interfaces.SAMD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_I2CM_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      SYSOP         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype SERCOM_ADDR_SERCOM_I2CM_ADDR_Field is Interfaces.SAMD.UInt11;
   subtype SERCOM_ADDR_SERCOM_I2CM_LEN_Field is Interfaces.SAMD.Byte;

   --  I2CM Address
   type SERCOM_ADDR_SERCOM_I2CM_Register is record
      --  Address Value
      ADDR           : SERCOM_ADDR_SERCOM_I2CM_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_12 : Interfaces.SAMD.UInt2 := 16#0#;
      --  Length Enable
      LENEN          : Boolean := False;
      --  High Speed Mode
      HS             : Boolean := False;
      --  Ten Bit Addressing Enable
      TENBITEN       : Boolean := False;
      --  Length
      LEN            : SERCOM_ADDR_SERCOM_I2CM_LEN_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.SAMD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_ADDR_SERCOM_I2CM_Register use record
      ADDR           at 0 range 0 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      LENEN          at 0 range 13 .. 13;
      HS             at 0 range 14 .. 14;
      TENBITEN       at 0 range 15 .. 15;
      LEN            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  I2CM Debug Control
   type SERCOM_DBGCTRL_SERCOM_I2CM_Register is record
      --  Debug Mode
      DBGSTOP      : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DBGCTRL_SERCOM_I2CM_Register use record
      DBGSTOP      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  I2C Master Mode
   type SercomI2cm_Cluster is record
      --  I2CM Control A
      CTRLA    : aliased SERCOM_CTRLA_SERCOM_I2CM_Register;
      --  I2CM Control B
      CTRLB    : aliased SERCOM_CTRLB_SERCOM_I2CM_Register;
      --  I2CM Baud Rate
      BAUD     : aliased SERCOM_BAUD_SERCOM_I2CM_Register;
      --  I2CM Interrupt Enable Clear
      INTENCLR : aliased SERCOM_INTENCLR_SERCOM_I2CM_Register;
      --  I2CM Interrupt Enable Set
      INTENSET : aliased SERCOM_INTENSET_SERCOM_I2CM_Register;
      --  I2CM Interrupt Flag Status and Clear
      INTFLAG  : aliased SERCOM_INTFLAG_SERCOM_I2CM_Register;
      --  I2CM Status
      STATUS   : aliased SERCOM_STATUS_SERCOM_I2CM_Register;
      --  I2CM Syncbusy
      SYNCBUSY : aliased SERCOM_SYNCBUSY_SERCOM_I2CM_Register;
      --  I2CM Address
      ADDR     : aliased SERCOM_ADDR_SERCOM_I2CM_Register;
      --  I2CM Data
      DATA     : aliased Interfaces.SAMD.Byte;
      --  I2CM Debug Control
      DBGCTRL  : aliased SERCOM_DBGCTRL_SERCOM_I2CM_Register;
   end record
     with Size => 416;

   for SercomI2cm_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLB    at 16#4# range 0 .. 31;
      BAUD     at 16#C# range 0 .. 31;
      INTENCLR at 16#14# range 0 .. 7;
      INTENSET at 16#16# range 0 .. 7;
      INTFLAG  at 16#18# range 0 .. 7;
      STATUS   at 16#1A# range 0 .. 15;
      SYNCBUSY at 16#1C# range 0 .. 31;
      ADDR     at 16#24# range 0 .. 31;
      DATA     at 16#28# range 0 .. 7;
      DBGCTRL  at 16#30# range 0 .. 7;
   end record;

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   subtype SERCOM_CTRLA_SERCOM_I2CS_SDAHOLD_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLA_SERCOM_I2CS_SPEED_Field is Interfaces.SAMD.UInt2;

   --  I2CS Control A
   type SERCOM_CTRLA_SERCOM_I2CS_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect :=
                        Interfaces.SAMD.SERCOM.Usart_Ext_Clk;
      --  unspecified
      Reserved_5_6   : Interfaces.SAMD.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  unspecified
      Reserved_8_15  : Interfaces.SAMD.Byte := 16#0#;
      --  Pin Usage
      PINOUT         : Boolean := False;
      --  unspecified
      Reserved_17_19 : Interfaces.SAMD.UInt3 := 16#0#;
      --  SDA Hold Time
      SDAHOLD        : SERCOM_CTRLA_SERCOM_I2CS_SDAHOLD_Field := 16#0#;
      --  unspecified
      Reserved_22_22 : Interfaces.SAMD.Bit := 16#0#;
      --  Slave SCL Low Extend Timeout
      SEXTTOEN       : Boolean := False;
      --  Transfer Speed
      SPEED          : SERCOM_CTRLA_SERCOM_I2CS_SPEED_Field := 16#0#;
      --  unspecified
      Reserved_26_26 : Interfaces.SAMD.Bit := 16#0#;
      --  SCL Clock Stretch Mode
      SCLSM          : Boolean := False;
      --  unspecified
      Reserved_28_29 : Interfaces.SAMD.UInt2 := 16#0#;
      --  SCL Low Timeout Enable
      LOWTOUTEN      : Boolean := False;
      --  unspecified
      Reserved_31_31 : Interfaces.SAMD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_I2CS_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      PINOUT         at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      SDAHOLD        at 0 range 20 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      SEXTTOEN       at 0 range 23 .. 23;
      SPEED          at 0 range 24 .. 25;
      Reserved_26_26 at 0 range 26 .. 26;
      SCLSM          at 0 range 27 .. 27;
      Reserved_28_29 at 0 range 28 .. 29;
      LOWTOUTEN      at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype SERCOM_CTRLB_SERCOM_I2CS_AMODE_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLB_SERCOM_I2CS_CMD_Field is Interfaces.SAMD.UInt2;

   --  I2CS Control B
   type SERCOM_CTRLB_SERCOM_I2CS_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.SAMD.Byte := 16#0#;
      --  Smart Mode Enable
      SMEN           : Boolean := False;
      --  PMBus Group Command
      GCMD           : Boolean := False;
      --  Automatic Address Acknowledge
      AACKEN         : Boolean := False;
      --  unspecified
      Reserved_11_13 : Interfaces.SAMD.UInt3 := 16#0#;
      --  Address Mode
      AMODE          : SERCOM_CTRLB_SERCOM_I2CS_AMODE_Field := 16#0#;
      --  Write-only. Command
      CMD            : SERCOM_CTRLB_SERCOM_I2CS_CMD_Field := 16#0#;
      --  Acknowledge Action
      ACKACT         : Boolean := False;
      --  unspecified
      Reserved_19_31 : Interfaces.SAMD.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_I2CS_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      SMEN           at 0 range 8 .. 8;
      GCMD           at 0 range 9 .. 9;
      AACKEN         at 0 range 10 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      AMODE          at 0 range 14 .. 15;
      CMD            at 0 range 16 .. 17;
      ACKACT         at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  I2CS Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_I2CS_Register is record
      --  Stop Received Interrupt Disable
      PREC         : Boolean := False;
      --  Address Match Interrupt Disable
      AMATCH       : Boolean := False;
      --  Data Interrupt Disable
      DRDY         : Boolean := False;
      --  unspecified
      Reserved_3_6 : Interfaces.SAMD.UInt4 := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_I2CS_Register use record
      PREC         at 0 range 0 .. 0;
      AMATCH       at 0 range 1 .. 1;
      DRDY         at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CS Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_I2CS_Register is record
      --  Stop Received Interrupt Enable
      PREC         : Boolean := False;
      --  Address Match Interrupt Enable
      AMATCH       : Boolean := False;
      --  Data Interrupt Enable
      DRDY         : Boolean := False;
      --  unspecified
      Reserved_3_6 : Interfaces.SAMD.UInt4 := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_I2CS_Register use record
      PREC         at 0 range 0 .. 0;
      AMATCH       at 0 range 1 .. 1;
      DRDY         at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CS Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_I2CS_Register is record
      --  Stop Received Interrupt
      PREC         : Boolean := False;
      --  Address Match Interrupt
      AMATCH       : Boolean := False;
      --  Data Interrupt
      DRDY         : Boolean := False;
      --  unspecified
      Reserved_3_6 : Interfaces.SAMD.UInt4 := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_I2CS_Register use record
      PREC         at 0 range 0 .. 0;
      AMATCH       at 0 range 1 .. 1;
      DRDY         at 0 range 2 .. 2;
      Reserved_3_6 at 0 range 3 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  I2CS Status
   type SERCOM_STATUS_SERCOM_I2CS_Register is record
      --  Bus Error
      BUSERR         : Boolean := False;
      --  Transmit Collision
      COLL           : Boolean := False;
      --  Read-only. Received Not Acknowledge
      RXNACK         : Boolean := False;
      --  Read-only. Read/Write Direction
      DIR            : Boolean := False;
      --  Read-only. Repeated Start
      SR             : Boolean := False;
      --  unspecified
      Reserved_5_5   : Interfaces.SAMD.Bit := 16#0#;
      --  SCL Low Timeout
      LOWTOUT        : Boolean := False;
      --  Read-only. Clock Hold
      CLKHOLD        : Boolean := False;
      --  unspecified
      Reserved_8_8   : Interfaces.SAMD.Bit := 16#0#;
      --  Slave SCL Low Extend Timeout
      SEXTTOUT       : Boolean := False;
      --  High Speed
      HS             : Boolean := False;
      --  unspecified
      Reserved_11_15 : Interfaces.SAMD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_I2CS_Register use record
      BUSERR         at 0 range 0 .. 0;
      COLL           at 0 range 1 .. 1;
      RXNACK         at 0 range 2 .. 2;
      DIR            at 0 range 3 .. 3;
      SR             at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      LOWTOUT        at 0 range 6 .. 6;
      CLKHOLD        at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      SEXTTOUT       at 0 range 9 .. 9;
      HS             at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  I2CS Syncbusy
   type SERCOM_SYNCBUSY_SERCOM_I2CS_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  unspecified
      Reserved_2_31 : Interfaces.SAMD.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_I2CS_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype SERCOM_ADDR_SERCOM_I2CS_ADDR_Field is Interfaces.SAMD.UInt10;
   subtype SERCOM_ADDR_SERCOM_I2CS_ADDRMASK_Field is Interfaces.SAMD.UInt10;

   --  I2CS Address
   type SERCOM_ADDR_SERCOM_I2CS_Register is record
      --  General Call Address Enable
      GENCEN         : Boolean := False;
      --  Address Value
      ADDR           : SERCOM_ADDR_SERCOM_I2CS_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : Interfaces.SAMD.UInt4 := 16#0#;
      --  Ten Bit Addressing Enable
      TENBITEN       : Boolean := False;
      --  unspecified
      Reserved_16_16 : Interfaces.SAMD.Bit := 16#0#;
      --  Address Mask
      ADDRMASK       : SERCOM_ADDR_SERCOM_I2CS_ADDRMASK_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : Interfaces.SAMD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_ADDR_SERCOM_I2CS_Register use record
      GENCEN         at 0 range 0 .. 0;
      ADDR           at 0 range 1 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      TENBITEN       at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      ADDRMASK       at 0 range 17 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  I2C Slave Mode
   type SercomI2cs_Cluster is record
      --  I2CS Control A
      CTRLA    : aliased SERCOM_CTRLA_SERCOM_I2CS_Register;
      --  I2CS Control B
      CTRLB    : aliased SERCOM_CTRLB_SERCOM_I2CS_Register;
      --  I2CS Interrupt Enable Clear
      INTENCLR : aliased SERCOM_INTENCLR_SERCOM_I2CS_Register;
      --  I2CS Interrupt Enable Set
      INTENSET : aliased SERCOM_INTENSET_SERCOM_I2CS_Register;
      --  I2CS Interrupt Flag Status and Clear
      INTFLAG  : aliased SERCOM_INTFLAG_SERCOM_I2CS_Register;
      --  I2CS Status
      STATUS   : aliased SERCOM_STATUS_SERCOM_I2CS_Register;
      --  I2CS Syncbusy
      SYNCBUSY : aliased SERCOM_SYNCBUSY_SERCOM_I2CS_Register;
      --  I2CS Address
      ADDR     : aliased SERCOM_ADDR_SERCOM_I2CS_Register;
      --  I2CS Data
      DATA     : aliased Interfaces.SAMD.Byte;
   end record
     with Size => 352;

   for SercomI2cs_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLB    at 16#4# range 0 .. 31;
      INTENCLR at 16#14# range 0 .. 7;
      INTENSET at 16#16# range 0 .. 7;
      INTFLAG  at 16#18# range 0 .. 7;
      STATUS   at 16#1A# range 0 .. 15;
      SYNCBUSY at 16#1C# range 0 .. 31;
      ADDR     at 16#24# range 0 .. 31;
      DATA     at 16#28# range 0 .. 7;
   end record;

   -----------------------------------
   -- SercomSpi cluster's Registers --
   -----------------------------------

   subtype SERCOM_CTRLA_SERCOM_SPI_DOPO_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLA_SERCOM_SPI_DIPO_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLA_SERCOM_SPI_FORM_Field is Interfaces.SAMD.UInt4;

   --  SPI Control A
   type SERCOM_CTRLA_SERCOM_SPI_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect :=
                        Interfaces.SAMD.SERCOM.Usart_Ext_Clk;
      --  unspecified
      Reserved_5_6   : Interfaces.SAMD.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Immediate Buffer Overflow Notification
      IBON           : Boolean := False;
      --  unspecified
      Reserved_9_15  : Interfaces.SAMD.UInt7 := 16#0#;
      --  Data Out Pinout
      DOPO           : SERCOM_CTRLA_SERCOM_SPI_DOPO_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : Interfaces.SAMD.UInt2 := 16#0#;
      --  Data In Pinout
      DIPO           : SERCOM_CTRLA_SERCOM_SPI_DIPO_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.SAMD.UInt2 := 16#0#;
      --  Frame Format
      FORM           : SERCOM_CTRLA_SERCOM_SPI_FORM_Field := 16#0#;
      --  Clock Phase
      CPHA           : Boolean := False;
      --  Clock Polarity
      CPOL           : Boolean := False;
      --  Data Order
      DORD           : Boolean := False;
      --  unspecified
      Reserved_31_31 : Interfaces.SAMD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_SPI_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      IBON           at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      DOPO           at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      DIPO           at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      FORM           at 0 range 24 .. 27;
      CPHA           at 0 range 28 .. 28;
      CPOL           at 0 range 29 .. 29;
      DORD           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype SERCOM_CTRLB_SERCOM_SPI_CHSIZE_Field is Interfaces.SAMD.UInt3;
   subtype SERCOM_CTRLB_SERCOM_SPI_AMODE_Field is Interfaces.SAMD.UInt2;

   --  SPI Control B
   type SERCOM_CTRLB_SERCOM_SPI_Register is record
      --  Character Size
      CHSIZE         : SERCOM_CTRLB_SERCOM_SPI_CHSIZE_Field := 16#0#;
      --  unspecified
      Reserved_3_5   : Interfaces.SAMD.UInt3 := 16#0#;
      --  Data Preload Enable
      PLOADEN        : Boolean := False;
      --  unspecified
      Reserved_7_8   : Interfaces.SAMD.UInt2 := 16#0#;
      --  Slave Select Low Detect Enable
      SSDE           : Boolean := False;
      --  unspecified
      Reserved_10_12 : Interfaces.SAMD.UInt3 := 16#0#;
      --  Master Slave Select Enable
      MSSEN          : Boolean := False;
      --  Address Mode
      AMODE          : SERCOM_CTRLB_SERCOM_SPI_AMODE_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.SAMD.Bit := 16#0#;
      --  Receiver Enable
      RXEN           : Boolean := False;
      --  unspecified
      Reserved_18_31 : Interfaces.SAMD.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_SPI_Register use record
      CHSIZE         at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      PLOADEN        at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      SSDE           at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      MSSEN          at 0 range 13 .. 13;
      AMODE          at 0 range 14 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      RXEN           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  SPI Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_SPI_Register is record
      --  Data Register Empty Interrupt Disable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Disable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Disable
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Disable
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : Interfaces.SAMD.UInt3 := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_SPI_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPI Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_SPI_Register is record
      --  Data Register Empty Interrupt Enable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Enable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Enable
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Enable
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : Interfaces.SAMD.UInt3 := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_SPI_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPI Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_SPI_Register is record
      --  Read-only. Data Register Empty Interrupt
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt
      TXC          : Boolean := False;
      --  Read-only. Receive Complete Interrupt
      RXC          : Boolean := False;
      --  Slave Select Low Interrupt Flag
      SSL          : Boolean := False;
      --  unspecified
      Reserved_4_6 : Interfaces.SAMD.UInt3 := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_SPI_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      SSL          at 0 range 3 .. 3;
      Reserved_4_6 at 0 range 4 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  SPI Status
   type SERCOM_STATUS_SERCOM_SPI_Register is record
      --  unspecified
      Reserved_0_1  : Interfaces.SAMD.UInt2 := 16#0#;
      --  Buffer Overflow
      BUFOVF        : Boolean := False;
      --  unspecified
      Reserved_3_15 : Interfaces.SAMD.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_SPI_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      BUFOVF        at 0 range 2 .. 2;
      Reserved_3_15 at 0 range 3 .. 15;
   end record;

   --  SPI Syncbusy
   type SERCOM_SYNCBUSY_SERCOM_SPI_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. CTRLB Synchronization Busy
      CTRLB         : Boolean;
      --  unspecified
      Reserved_3_31 : Interfaces.SAMD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_SPI_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype SERCOM_ADDR_SERCOM_SPI_ADDR_Field is Interfaces.SAMD.Byte;
   subtype SERCOM_ADDR_SERCOM_SPI_ADDRMASK_Field is Interfaces.SAMD.Byte;

   --  SPI Address
   type SERCOM_ADDR_SERCOM_SPI_Register is record
      --  Address Value
      ADDR           : SERCOM_ADDR_SERCOM_SPI_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : Interfaces.SAMD.Byte := 16#0#;
      --  Address Mask
      ADDRMASK       : SERCOM_ADDR_SERCOM_SPI_ADDRMASK_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.SAMD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_ADDR_SERCOM_SPI_Register use record
      ADDR           at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      ADDRMASK       at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SERCOM_DATA_SERCOM_SPI_DATA_Field is Interfaces.SAMD.UInt9;

   --  SPI Data
   type SERCOM_DATA_SERCOM_SPI_Register is record
      --  Data Value
      DATA          : SERCOM_DATA_SERCOM_SPI_DATA_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.SAMD.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DATA_SERCOM_SPI_Register use record
      DATA          at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  SPI Debug Control
   type SERCOM_DBGCTRL_SERCOM_SPI_Register is record
      --  Debug Mode
      DBGSTOP      : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DBGCTRL_SERCOM_SPI_Register use record
      DBGSTOP      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   --  SPI Mode
   type SercomSpi_Cluster is record
      --  SPI Control A
      CTRLA    : aliased SERCOM_CTRLA_SERCOM_SPI_Register;
      --  SPI Control B
      CTRLB    : aliased SERCOM_CTRLB_SERCOM_SPI_Register;
      --  SPI Baud Rate
      BAUD     : aliased Interfaces.SAMD.Byte;
      --  SPI Interrupt Enable Clear
      INTENCLR : aliased SERCOM_INTENCLR_SERCOM_SPI_Register;
      --  SPI Interrupt Enable Set
      INTENSET : aliased SERCOM_INTENSET_SERCOM_SPI_Register;
      --  SPI Interrupt Flag Status and Clear
      INTFLAG  : aliased SERCOM_INTFLAG_SERCOM_SPI_Register;
      --  SPI Status
      STATUS   : aliased SERCOM_STATUS_SERCOM_SPI_Register;
      --  SPI Syncbusy
      SYNCBUSY : aliased SERCOM_SYNCBUSY_SERCOM_SPI_Register;
      --  SPI Address
      ADDR     : aliased SERCOM_ADDR_SERCOM_SPI_Register;
      --  SPI Data
      DATA     : aliased SERCOM_DATA_SERCOM_SPI_Register;
      --  SPI Debug Control
      DBGCTRL  : aliased SERCOM_DBGCTRL_SERCOM_SPI_Register;
   end record
     with Size => 416;

   for SercomSpi_Cluster use record
      CTRLA    at 16#0# range 0 .. 31;
      CTRLB    at 16#4# range 0 .. 31;
      BAUD     at 16#C# range 0 .. 7;
      INTENCLR at 16#14# range 0 .. 7;
      INTENSET at 16#16# range 0 .. 7;
      INTFLAG  at 16#18# range 0 .. 7;
      STATUS   at 16#1A# range 0 .. 15;
      SYNCBUSY at 16#1C# range 0 .. 31;
      ADDR     at 16#24# range 0 .. 31;
      DATA     at 16#28# range 0 .. 31;
      DBGCTRL  at 16#30# range 0 .. 7;
   end record;

   -------------------------------------
   -- SercomUsart cluster's Registers --
   -------------------------------------

   subtype SERCOM_CTRLA_SERCOM_USART_SAMPR_Field is Interfaces.SAMD.UInt3;
   subtype SERCOM_CTRLA_SERCOM_USART_TXPO_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLA_SERCOM_USART_RXPO_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLA_SERCOM_USART_SAMPA_Field is Interfaces.SAMD.UInt2;
   subtype SERCOM_CTRLA_SERCOM_USART_FORM_Field is Interfaces.SAMD.UInt4;

   --  USART Control A
   type SERCOM_CTRLA_SERCOM_USART_Register is record
      --  Software Reset
      SWRST          : Boolean := False;
      --  Enable
      ENABLE         : Boolean := False;
      --  Operating Mode
      MODE           : CTRLA_MODESelect :=
                        Interfaces.SAMD.SERCOM.Usart_Ext_Clk;
      --  unspecified
      Reserved_5_6   : Interfaces.SAMD.UInt2 := 16#0#;
      --  Run during Standby
      RUNSTDBY       : Boolean := False;
      --  Immediate Buffer Overflow Notification
      IBON           : Boolean := False;
      --  unspecified
      Reserved_9_12  : Interfaces.SAMD.UInt4 := 16#0#;
      --  Sample
      SAMPR          : SERCOM_CTRLA_SERCOM_USART_SAMPR_Field := 16#0#;
      --  Transmit Data Pinout
      TXPO           : SERCOM_CTRLA_SERCOM_USART_TXPO_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : Interfaces.SAMD.UInt2 := 16#0#;
      --  Receive Data Pinout
      RXPO           : SERCOM_CTRLA_SERCOM_USART_RXPO_Field := 16#0#;
      --  Sample Adjustment
      SAMPA          : SERCOM_CTRLA_SERCOM_USART_SAMPA_Field := 16#0#;
      --  Frame Format
      FORM           : SERCOM_CTRLA_SERCOM_USART_FORM_Field := 16#0#;
      --  Communication Mode
      CMODE          : Boolean := False;
      --  Clock Polarity
      CPOL           : Boolean := False;
      --  Data Order
      DORD           : Boolean := False;
      --  unspecified
      Reserved_31_31 : Interfaces.SAMD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLA_SERCOM_USART_Register use record
      SWRST          at 0 range 0 .. 0;
      ENABLE         at 0 range 1 .. 1;
      MODE           at 0 range 2 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      RUNSTDBY       at 0 range 7 .. 7;
      IBON           at 0 range 8 .. 8;
      Reserved_9_12  at 0 range 9 .. 12;
      SAMPR          at 0 range 13 .. 15;
      TXPO           at 0 range 16 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      RXPO           at 0 range 20 .. 21;
      SAMPA          at 0 range 22 .. 23;
      FORM           at 0 range 24 .. 27;
      CMODE          at 0 range 28 .. 28;
      CPOL           at 0 range 29 .. 29;
      DORD           at 0 range 30 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype SERCOM_CTRLB_SERCOM_USART_CHSIZE_Field is Interfaces.SAMD.UInt3;

   --  USART Control B
   type SERCOM_CTRLB_SERCOM_USART_Register is record
      --  Character Size
      CHSIZE         : SERCOM_CTRLB_SERCOM_USART_CHSIZE_Field := 16#0#;
      --  unspecified
      Reserved_3_5   : Interfaces.SAMD.UInt3 := 16#0#;
      --  Stop Bit Mode
      SBMODE         : Boolean := False;
      --  unspecified
      Reserved_7_7   : Interfaces.SAMD.Bit := 16#0#;
      --  Collision Detection Enable
      COLDEN         : Boolean := False;
      --  Start of Frame Detection Enable
      SFDE           : Boolean := False;
      --  Encoding Format
      ENC            : Boolean := False;
      --  unspecified
      Reserved_11_12 : Interfaces.SAMD.UInt2 := 16#0#;
      --  Parity Mode
      PMODE          : Boolean := False;
      --  unspecified
      Reserved_14_15 : Interfaces.SAMD.UInt2 := 16#0#;
      --  Transmitter Enable
      TXEN           : Boolean := False;
      --  Receiver Enable
      RXEN           : Boolean := False;
      --  unspecified
      Reserved_18_31 : Interfaces.SAMD.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_CTRLB_SERCOM_USART_Register use record
      CHSIZE         at 0 range 0 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      SBMODE         at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      COLDEN         at 0 range 8 .. 8;
      SFDE           at 0 range 9 .. 9;
      ENC            at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      PMODE          at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      TXEN           at 0 range 16 .. 16;
      RXEN           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype SERCOM_BAUD_FRAC_MODE_SERCOM_USART_BAUD_Field is
     Interfaces.SAMD.UInt13;
   subtype SERCOM_BAUD_FRAC_MODE_SERCOM_USART_FP_Field is
     Interfaces.SAMD.UInt3;

   --  USART Baud Rate
   type SERCOM_BAUD_FRAC_MODE_SERCOM_USART_Register is record
      --  Baud Rate Value
      BAUD : SERCOM_BAUD_FRAC_MODE_SERCOM_USART_BAUD_Field := 16#0#;
      --  Fractional Part
      FP   : SERCOM_BAUD_FRAC_MODE_SERCOM_USART_FP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_BAUD_FRAC_MODE_SERCOM_USART_Register use record
      BAUD at 0 range 0 .. 12;
      FP   at 0 range 13 .. 15;
   end record;

   subtype SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_BAUD_Field is
     Interfaces.SAMD.UInt13;
   subtype SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_FP_Field is
     Interfaces.SAMD.UInt3;

   --  USART Baud Rate
   type SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_Register is record
      --  Baud Rate Value
      BAUD : SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_BAUD_Field := 16#0#;
      --  Fractional Part
      FP   : SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_FP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_Register use record
      BAUD at 0 range 0 .. 12;
      FP   at 0 range 13 .. 15;
   end record;

   --  USART Interrupt Enable Clear
   type SERCOM_INTENCLR_SERCOM_USART_Register is record
      --  Data Register Empty Interrupt Disable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Disable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Disable
      RXC          : Boolean := False;
      --  Receive Start Interrupt Disable
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt Disable
      CTSIC        : Boolean := False;
      --  Break Received Interrupt Disable
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : Interfaces.SAMD.Bit := 16#0#;
      --  Combined Error Interrupt Disable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENCLR_SERCOM_USART_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART Interrupt Enable Set
   type SERCOM_INTENSET_SERCOM_USART_Register is record
      --  Data Register Empty Interrupt Enable
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt Enable
      TXC          : Boolean := False;
      --  Receive Complete Interrupt Enable
      RXC          : Boolean := False;
      --  Receive Start Interrupt Enable
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt Enable
      CTSIC        : Boolean := False;
      --  Break Received Interrupt Enable
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : Interfaces.SAMD.Bit := 16#0#;
      --  Combined Error Interrupt Enable
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTENSET_SERCOM_USART_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART Interrupt Flag Status and Clear
   type SERCOM_INTFLAG_SERCOM_USART_Register is record
      --  Read-only. Data Register Empty Interrupt
      DRE          : Boolean := False;
      --  Transmit Complete Interrupt
      TXC          : Boolean := False;
      --  Read-only. Receive Complete Interrupt
      RXC          : Boolean := False;
      --  Write-only. Receive Start Interrupt
      RXS          : Boolean := False;
      --  Clear To Send Input Change Interrupt
      CTSIC        : Boolean := False;
      --  Break Received Interrupt
      RXBRK        : Boolean := False;
      --  unspecified
      Reserved_6_6 : Interfaces.SAMD.Bit := 16#0#;
      --  Combined Error Interrupt
      ERROR        : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_INTFLAG_SERCOM_USART_Register use record
      DRE          at 0 range 0 .. 0;
      TXC          at 0 range 1 .. 1;
      RXC          at 0 range 2 .. 2;
      RXS          at 0 range 3 .. 3;
      CTSIC        at 0 range 4 .. 4;
      RXBRK        at 0 range 5 .. 5;
      Reserved_6_6 at 0 range 6 .. 6;
      ERROR        at 0 range 7 .. 7;
   end record;

   --  USART Status
   type SERCOM_STATUS_SERCOM_USART_Register is record
      --  Parity Error
      PERR          : Boolean := False;
      --  Frame Error
      FERR          : Boolean := False;
      --  Buffer Overflow
      BUFOVF        : Boolean := False;
      --  Read-only. Clear To Send
      CTS           : Boolean := False;
      --  Inconsistent Sync Field
      ISF           : Boolean := False;
      --  Collision Detected
      COLL          : Boolean := False;
      --  unspecified
      Reserved_6_15 : Interfaces.SAMD.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_STATUS_SERCOM_USART_Register use record
      PERR          at 0 range 0 .. 0;
      FERR          at 0 range 1 .. 1;
      BUFOVF        at 0 range 2 .. 2;
      CTS           at 0 range 3 .. 3;
      ISF           at 0 range 4 .. 4;
      COLL          at 0 range 5 .. 5;
      Reserved_6_15 at 0 range 6 .. 15;
   end record;

   --  USART Syncbusy
   type SERCOM_SYNCBUSY_SERCOM_USART_Register is record
      --  Read-only. Software Reset Synchronization Busy
      SWRST         : Boolean;
      --  Read-only. SERCOM Enable Synchronization Busy
      ENABLE        : Boolean;
      --  Read-only. CTRLB Synchronization Busy
      CTRLB         : Boolean;
      --  unspecified
      Reserved_3_31 : Interfaces.SAMD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SERCOM_SYNCBUSY_SERCOM_USART_Register use record
      SWRST         at 0 range 0 .. 0;
      ENABLE        at 0 range 1 .. 1;
      CTRLB         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype SERCOM_DATA_SERCOM_USART_DATA_Field is Interfaces.SAMD.UInt9;

   --  USART Data
   type SERCOM_DATA_SERCOM_USART_Register is record
      --  Data Value
      DATA          : SERCOM_DATA_SERCOM_USART_DATA_Field := 16#0#;
      --  unspecified
      Reserved_9_15 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DATA_SERCOM_USART_Register use record
      DATA          at 0 range 0 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   --  USART Debug Control
   type SERCOM_DBGCTRL_SERCOM_USART_Register is record
      --  Debug Mode
      DBGSTOP      : Boolean := False;
      --  unspecified
      Reserved_1_7 : Interfaces.SAMD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 8,
          Bit_Order => System.Low_Order_First;

   for SERCOM_DBGCTRL_SERCOM_USART_Register use record
      DBGSTOP      at 0 range 0 .. 0;
      Reserved_1_7 at 0 range 1 .. 7;
   end record;

   type SercomUsart_Disc is
     (Default,
      Frac_Mode,
      Fracfp_Mode,
      Usartfp_Mode);

   --  USART Mode
   type SercomUsart_Cluster
     (Discriminent : SercomUsart_Disc := Default)
   is record
      --  USART Control A
      CTRLA             : aliased SERCOM_CTRLA_SERCOM_USART_Register;
      --  USART Control B
      CTRLB             : aliased SERCOM_CTRLB_SERCOM_USART_Register;
      --  USART Receive Pulse Length
      RXPL              : aliased Interfaces.SAMD.Byte;
      --  USART Interrupt Enable Clear
      INTENCLR          : aliased SERCOM_INTENCLR_SERCOM_USART_Register;
      --  USART Interrupt Enable Set
      INTENSET          : aliased SERCOM_INTENSET_SERCOM_USART_Register;
      --  USART Interrupt Flag Status and Clear
      INTFLAG           : aliased SERCOM_INTFLAG_SERCOM_USART_Register;
      --  USART Status
      STATUS            : aliased SERCOM_STATUS_SERCOM_USART_Register;
      --  USART Syncbusy
      SYNCBUSY          : aliased SERCOM_SYNCBUSY_SERCOM_USART_Register;
      --  USART Data
      DATA              : aliased SERCOM_DATA_SERCOM_USART_Register;
      --  USART Debug Control
      DBGCTRL           : aliased SERCOM_DBGCTRL_SERCOM_USART_Register;
      case Discriminent is
         when Default =>
            --  USART Baud Rate
            BAUD : aliased Interfaces.SAMD.UInt16;
         when Frac_Mode =>
            --  USART Baud Rate
            BAUD_FRAC_MODE : aliased SERCOM_BAUD_FRAC_MODE_SERCOM_USART_Register;
         when Fracfp_Mode =>
            --  USART Baud Rate
            BAUD_FRACFP_MODE : aliased SERCOM_BAUD_FRACFP_MODE_SERCOM_USART_Register;
         when Usartfp_Mode =>
            --  USART Baud Rate
            BAUD_USARTFP_MODE : aliased Interfaces.SAMD.UInt16;
      end case;
   end record
     with Unchecked_Union, Size => 416;

   for SercomUsart_Cluster use record
      CTRLA             at 16#0# range 0 .. 31;
      CTRLB             at 16#4# range 0 .. 31;
      RXPL              at 16#E# range 0 .. 7;
      INTENCLR          at 16#14# range 0 .. 7;
      INTENSET          at 16#16# range 0 .. 7;
      INTFLAG           at 16#18# range 0 .. 7;
      STATUS            at 16#1A# range 0 .. 15;
      SYNCBUSY          at 16#1C# range 0 .. 31;
      DATA              at 16#28# range 0 .. 15;
      DBGCTRL           at 16#30# range 0 .. 7;
      BAUD              at 16#C# range 0 .. 15;
      BAUD_FRAC_MODE    at 16#C# range 0 .. 15;
      BAUD_FRACFP_MODE  at 16#C# range 0 .. 15;
      BAUD_USARTFP_MODE at 16#C# range 0 .. 15;
   end record;

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   -----------------------------------
   -- SercomSpi cluster's Registers --
   -----------------------------------

   -------------------------------------
   -- SercomUsart cluster's Registers --
   -------------------------------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   -----------------------------------
   -- SercomSpi cluster's Registers --
   -----------------------------------

   -------------------------------------
   -- SercomUsart cluster's Registers --
   -------------------------------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   -----------------------------------
   -- SercomSpi cluster's Registers --
   -----------------------------------

   -------------------------------------
   -- SercomUsart cluster's Registers --
   -------------------------------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   -----------------------------------
   -- SercomSpi cluster's Registers --
   -----------------------------------

   -------------------------------------
   -- SercomUsart cluster's Registers --
   -------------------------------------

   ------------------------------------
   -- SercomI2cm cluster's Registers --
   ------------------------------------

   ------------------------------------
   -- SercomI2cs cluster's Registers --
   ------------------------------------

   -----------------------------------
   -- SercomSpi cluster's Registers --
   -----------------------------------

   -------------------------------------
   -- SercomUsart cluster's Registers --
   -------------------------------------

   -----------------
   -- Peripherals --
   -----------------

   type SERCOM0_Disc is
     (I2Cm,
      I2Cs,
      Spi,
      Usart);

   --  Serial Communication Interface 0
   type SERCOM_Peripheral
     (Discriminent : SERCOM0_Disc := I2Cm)
   is record
      case Discriminent is
         when I2Cm =>
            --  I2C Master Mode
            SERCOM_I2CM : aliased SercomI2cm_Cluster;
         when I2Cs =>
            --  I2C Slave Mode
            SERCOM_I2CS : aliased SercomI2cs_Cluster;
         when Spi =>
            --  SPI Mode
            SERCOM_SPI : aliased SercomSpi_Cluster;
         when Usart =>
            --  USART Mode
            SERCOM_USART : aliased SercomUsart_Cluster;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for SERCOM_Peripheral use record
      SERCOM_I2CM  at 0 range 0 .. 415;
      SERCOM_I2CS  at 0 range 0 .. 351;
      SERCOM_SPI   at 0 range 0 .. 415;
      SERCOM_USART at 0 range 0 .. 415;
   end record;

   --  Serial Communication Interface 0
   SERCOM0_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM0_Base;

   --  Serial Communication Interface 1
   SERCOM1_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM1_Base;

   --  Serial Communication Interface 2
   SERCOM2_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM2_Base;

   --  Serial Communication Interface 3
   SERCOM3_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM3_Base;

   --  Serial Communication Interface 4
   SERCOM4_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM4_Base;

   --  Serial Communication Interface 5
   SERCOM5_Periph : aliased SERCOM_Peripheral
     with Import, Address => SERCOM5_Base;

end Interfaces.SAMD.SERCOM;
