CUPS_BACKEND_DIR = /usr/lib/cups/backend
CUPS_FILTER_DIR = /usr/lib/cups/filter
CUPS_PPD_DIR = /usr/share/cups/model

cups-img.ppd.gz: cups-img.drv
	ppdc -d . $<
	gzip -c cups-img.ppd > cups-img.ppd.gz


install: cups-img.ppd.gz
	install -o root -g lp -m 755 cups-img-filter $(CUPS_FILTER_DIR)/imgcap-raw
	install -o root -g lp -m 755 cups-img-backend $(CUPS_BACKEND_DIR)/imgcap
	mkdir -p $(CUPS_PPD_DIR)/livelink
	cp cups-img.ppd.gz $(CUPS_PPD_DIR)/livelink

default: cups-img.ppd
