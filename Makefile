#  __     __         _       _     _
#  \ \   / /_ _ _ __(_) __ _| |__ | | ___ ___
#   \ \ / / _` | '__| |/ _` | '_ \| |/ _ \ __|
#    \ V / (_| | |  | | (_| | |_) | |  __\__ \
#     \_/ \__,_|_|  |_|\__,_|_.__/|_|\___|___/
#

base_version = 0.1.0
sources_dir = rpmbuild/SOURCES
spec_dir = rpmbuild/SPECS
volume = /home/rpmuser

# This variables can be overriden
VERSION ?= $(base_version)-$(shell git rev-parse --short=7 HEAD)
CURRENT_DIR ?= $$PWD
PARITY_VERSION ?= 2.1.10

#   _____                    _
#  |_   _|_ _ _ __ __ _  ___| |_ ___
#    | |/ _` | '__/ _` |/ _ \ __/ __|
#    | | (_| | | | (_| |  __/ |_\__ \
#    |_|\__,_|_|  \__, |\___|\__|___/
#                 |___/

build:
	docker build --build-arg parity_version=$(PARITY_VERSION) \
	-t rpmbuilder:$(VERSION) .

shell:
	docker run -it -v $(CURRENT_DIR):/$(volume) \
	--user $(shell id -u):$(shell id -g) \
	rpmbuilder:$(VERSION)

rpm-parity-tar:
	docker run -it -v $(CURRENT_DIR):$(volume) \
	--user 2000:2000 rpmbuilder:$(VERSION) \
	bash -c /opt/tar.sh

rpm-parity: rpm-parity-tar
	docker run -it -v $(CURRENT_DIR):$(volume) \
	--user 2000:2000 rpmbuilder:$(VERSION) \
	bash -c /opt/rpm.sh

lint:
	docker run -it -v $(CURRENT_DIR):$(volume) \
	--user 2000:2000 rpmbuilder:$(VERSION) \
	rpmlint $(spec_dir)/parity.spec
