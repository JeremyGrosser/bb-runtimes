with Interfaces.RP2040.XIP_SSI; use Interfaces.RP2040.XIP_SSI;

package Boot2_Generic_03 is
   --  Clock divider for flash, must be even (clk_sys / SCKDV)
   BAUDR      : constant BAUDR_Register :=
      (SCKDV  => 4,
       others => <>);

   CTRLR0     : constant CTRLR0_Register :=
      (DFS_32  => 31,            --  Data frame size (minus 1)
       SPI_FRF => STD,           --  Frame format
       TMOD    => EEPROM_READ,   --  Transfer mode
       others  => <>);

   SPI_CTRLR0 : constant SPI_CTRLR0_Register :=
      (TRANS_TYPE  => Val_1C1A, --  Command and address frame format
       ADDR_L      => 6,        --  Address bits divided by 4
       INST_L      => Val_8B,   --  Instruction length
       WAIT_CYCLES => 0,        --  Clocks after mode bits
       XIP_CMD     => 16#03#,   --  SPI read command
       others      => <>);
end Boot2_Generic_03;
