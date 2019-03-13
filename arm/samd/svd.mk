SVD2ADA_DIR=$(shell dirname $(shell which svd2ada))

.PHONY: svd

all: svd

svd:
	rm -rf */svd */svdtmp
	$(SVD2ADA_DIR)/svd2ada $(SVD2ADA_DIR)/CMSIS-SVD/ATMEL/ATSAMD21G18A.svd -p Interfaces.SAMD -o samd21/svdtmp --boolean
	for d in */svdtmp; do \
	  cd $$d; \
	  mkdir ../svd; \
	  mv i-samd.ads ../svd; \
	  mv i-samd-pm.ads ../svd; \
	  mv i-samd-gclk.ads ../svd; \
	  mv i-samd-sysctrl.ads ../svd; \
	  mv i-samd-rtc.ads ../svd; \
	  mv i-samd-mtb.ads ../svd; \
	  mv i-samd-sercom.ads ../svd; \
	  mv i-samd-port.ads ../svd; \
	  mv handler.S ../svd; \
	  mv a-intnam.ads ../svd; \
	  cd ../..; \
	done
	rm -rf */svdtmp
