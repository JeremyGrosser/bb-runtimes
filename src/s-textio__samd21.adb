------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                        S Y S T E M . T E X T _ I O                       --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--            Copyright (C) 2011, Free Software Foundation, Inc.            --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
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
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  Minimal version of Text_IO body for use on ATSAMD21xxxx using SERCOM3

with Interfaces; use Interfaces;

with Interfaces.SAMD;        use Interfaces.SAMD;
with Interfaces.SAMD.PM;     use Interfaces.SAMD.PM;
with Interfaces.SAMD.GCLK;   use Interfaces.SAMD.GCLK;
with Interfaces.SAMD.SERCOM; use Interfaces.SAMD.SERCOM;
with Interfaces.SAMD.PORT;   use Interfaces.SAMD.PORT;

package body System.Text_IO is

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
      USART : aliased SercomUsart_Cluster := SERCOM3_Periph.SERCOM_USART;
   begin
      --  PA22 TX
      --  PA23 RX
      PORT_Periph.PMUX0 (11).PMUXE := C;
      PORT_Periph.PMUX0 (11).PMUXO := C;
      PORT_Periph.PINCFG0 (22).PMUXEN := True;
      PORT_Periph.PINCFG0 (23).PMUXEN := True;
      PORT_Periph.PINCFG0 (23).INEN := True;
      PORT_Periph.DIR0 := PORT_Periph.DIR0 or
                          Shift_Left (1, 22) or
                          Shift_Left (1, 23);

      GCLK_Periph.CLKCTRL.ID := Sercom3_Core;
      GCLK_Periph.CLKCTRL.GEN := Gclk0;
      GCLK_Periph.CLKCTRL.CLKEN := True;

      PM_Periph.APBCMASK.SERCOM3 := True;

      USART.CTRLA.SWRST := True;
      while USART.SYNCBUSY.SWRST = True loop
         null;
      end loop;

      --  115200 baud
      USART.BAUD := 5138;

      USART.CTRLA.MODE := Usart_Int_Clk;
      USART.CTRLA.TXPO := 0;
      USART.CTRLA.RXPO := 1;
      USART.CTRLA.DORD := True;
      USART.CTRLA.SAMPR := 2;

      USART.CTRLB.CHSIZE := 0;
      USART.CTRLB.SBMODE := True;
      USART.CTRLB.TXEN := True;
      USART.CTRLB.RXEN := True;
      while USART.SYNCBUSY.CTRLB = True loop
         null;
      end loop;

      USART.CTRLA.ENABLE := True;
      while USART.SYNCBUSY.ENABLE = True loop
         null;
      end loop;

      USART.INTENSET.RXC := True;
      USART.INTENSET.TXC := True;

      --  send a byte to generate the first TXC interrupt
      USART.DATA.DATA := 16#00#;

      Initialized := True;
   end Initialize;

   -----------------
   -- Is_Rx_Ready --
   -----------------

   function Is_Rx_Ready return Boolean is
   begin
      return SERCOM3_Periph.SERCOM_USART.INTFLAG.RXC;
   end Is_Rx_Ready;

   -----------------
   -- Is_Tx_Ready --
   -----------------

   function Is_Tx_Ready return Boolean is
   begin
      return SERCOM3_Periph.SERCOM_USART.INTFLAG.TXC;
   end Is_Tx_Ready;

   ---------
   -- Get --
   ---------

   function Get return Character is
   begin
      return Character'Val (SERCOM3_Periph.SERCOM_USART.DATA.DATA and 16#FF#);
   end Get;

   ---------
   -- Put --
   ---------

   procedure Put (C : Character) is
   begin
      SERCOM3_Periph.SERCOM_USART.DATA.DATA := Character'Pos (C);
   end Put;

   ----------------------------
   -- Use_Cr_Lf_For_New_Line --
   ----------------------------

   function Use_Cr_Lf_For_New_Line return Boolean is
   begin
      return True;
   end Use_Cr_Lf_For_New_Line;

end System.Text_IO;
