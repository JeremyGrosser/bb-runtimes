--  The SSI cannot be configured while enabled, so the boot ROM copies the
--  first 256 bytes of flash (referred to by the linker as .boot2) to SRAM and
--  executes it. This procedure should disable SSI, configure it for the flash
--  chip in use, re-enable SSI, then jump to the reset vector in XIP memory.
--
--  This is the generic version for all SPI flash chips that respond to the
--  0x03 read command.
with Interfaces.RP2040.XIP_SSI; use Interfaces.RP2040.XIP_SSI;
with Boot2_Generic_03;          use Boot2_Generic_03;

procedure Boot2
   with Linker_Section => ".boot2"
is
begin
   --  Disable SSI
   XIP_SSI_Periph.SSIENR.SSI_EN := False;

   --  Configure SSI
   XIP_SSI_Periph.BAUDR := BAUDR;
   XIP_SSI_Periph.CTRLR0 := CTRLR0;
   XIP_SSI_Periph.SPI_CTRLR0 := SPI_CTRLR0;

   --  Single 32b read XXX why is this here????
   XIP_SSI_Periph.CTRLR1.NDF := 0;

   --  Enable SSI
   XIP_SSI_Periph.SSIENR.SSI_EN := True;
end Boot2;
