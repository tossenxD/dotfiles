HOME-CONFIG-SRC = home-config.scm

reconfigure:
	guix home -L . reconfigure $(HOME-CONFIG-SRC)

container:
	guix home -L . container $(HOME-CONFIG-SRC)

clean:
	git clean -fX
