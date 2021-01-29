SVD2ADA_DIR=$(shell dirname $(shell which svd2ada))

.PHONY: svd

all: svd

svd: svd-rp2040

svd-rp2040:
	rm -rf */svd */svdtmp
	$(SVD2ADA_DIR)/svd2ada $(SVD2ADA_DIR)/CMSIS-SVD/RaspberryPi/rp2040.svd -p Interfaces.RP2040 -o rp2040/svdtmp --boolean
	for d in */svdtmp; do \
	  cd $$d; \
	  mkdir ../svd; \
	  mv i-rp2040.ads ../svd; \
	  mv i-rp2040-resets.ads ../svd; \
	  mv a-intnam.ads ../svd; \
	  mv handler.S ../svd; \
	  cd ../..; \
	done
	rm -rf */svdtmp
