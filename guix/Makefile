SRC-DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
HOME-CONFIG-SRC := $(SRC-DIR)home-config.scm

reconfigure:
	guix home -L $(SRC-DIR) reconfigure $(HOME-CONFIG-SRC)

container:
	guix home -L $(SRC-DIR) container $(HOME-CONFIG-SRC)

clean:
	cd $(SRC-DIR); git clean -fX
