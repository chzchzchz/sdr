.PHONY: run-cad
run-cad: build
	docker run --rm --net host -e DISPLAY \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $(HOME)/.Xauthority:/.Xauthority \
		-e XAUTHORITY=/.Xauthority \
		-e QT_X11_NO_MITSHM=1 \
		--user `id -u` \
		--device /dev/dri:/dev/dri \
		-t sdrkit:openems \
		/opt/openEMS/bin/AppCSXCAD.sh
.PHONY: run-openems
run-openems: build
	docker run --rm --net host -e DISPLAY \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $(HOME)/.Xauthority:/.Xauthority \
		-e XAUTHORITY=/.Xauthority \
		-e QT_X11_NO_MITSHM=1 \
		--user `id -u` \
		--device /dev/dri:/dev/dri \
		-t sdrkit:openems \
		/opt/openEMS/bin/openEMS.sh

.PHONY: build
build:
	docker build -t sdrkit:openems .
