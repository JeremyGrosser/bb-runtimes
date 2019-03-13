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

--  This is a version for the Microchip ATSAMD21G18A device: Cortex-M0+
--  Microcontroller with 256KB Flash, 32KB SRAM, 48-pin package MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   Sys_Tick_Interrupt : constant Interrupt_ID := -1;
   PM_Interrupt       : constant Interrupt_ID := 0;
   SYSCTRL_Interrupt  : constant Interrupt_ID := 1;
   WDT_Interrupt      : constant Interrupt_ID := 2;
   RTC_Interrupt      : constant Interrupt_ID := 3;
   EIC_Interrupt      : constant Interrupt_ID := 4;
   NVMCTRL_Interrupt  : constant Interrupt_ID := 5;
   DMAC_Interrupt     : constant Interrupt_ID := 6;
   USB_Interrupt      : constant Interrupt_ID := 7;
   EVSYS_Interrupt    : constant Interrupt_ID := 8;
   SERCOM0_Interrupt  : constant Interrupt_ID := 9;
   SERCOM1_Interrupt  : constant Interrupt_ID := 10;
   SERCOM2_Interrupt  : constant Interrupt_ID := 11;
   SERCOM3_Interrupt  : constant Interrupt_ID := 12;
   SERCOM4_Interrupt  : constant Interrupt_ID := 13;
   SERCOM5_Interrupt  : constant Interrupt_ID := 14;
   TCC0_Interrupt     : constant Interrupt_ID := 15;
   TCC1_Interrupt     : constant Interrupt_ID := 16;
   TCC2_Interrupt     : constant Interrupt_ID := 17;
   TC3_Interrupt      : constant Interrupt_ID := 18;
   TC4_Interrupt      : constant Interrupt_ID := 19;
   TC5_Interrupt      : constant Interrupt_ID := 20;
   ADC_Interrupt      : constant Interrupt_ID := 23;
   AC_Interrupt       : constant Interrupt_ID := 24;
   DAC_Interrupt      : constant Interrupt_ID := 25;
   I2S_Interrupt      : constant Interrupt_ID := 27;

end Ada.Interrupts.Names;
