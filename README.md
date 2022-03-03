Introduction
------------

A simple cups fake driver to capture images sent to a printer via AirPrint.  Designed to allow transfer of JPEGs, PNGs & PDFs from iPhones.

Files
-----

 - Makefile installs the scripts
 - cups-img.drv contains the definitions of the media "supported" by the printer
 - cups-img-filter is a simple script that reads the raw data in and prints it out again.
 - cups-img-backend receives the file, writes it to a tmp file and broadcasts a dbus notification with the file location.

Installation
------------

```sh
lpadmin -p PhotoKiosk -E -v imgcap:/ -m livelink/cups-img.ppd.gz
cupsenable PhotoKiosk
cupsaccept PhotoKiosk
```
