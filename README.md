# Parity Ethereum RPM package

[![License](https://img.shields.io/badge/License-GPLv3%202.0-brightgreen.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0)

Build an RPM package for the Parity Ethereum latest stable client. This RPM package installs Parity Ethereum as a `systemd` service.

## Requirements

If you want to build your RPM package by yourself, you need to install `docker` and `make`.
>Also, if you want to compile the `parity` executable from the sources, you need `vagrant` to be installed in the system.

When done, see the following section.

## Build

First, you need to build the docker image with all required dependencies to generate the RPM package. Just execute the next line from the root directory of this project:

```bash
$ make build
```

>This will create a new docker image. You can check it using the `docker images` command.

Now, to generate an RPM package for the current `parity.spec`, just execute:

```bash
$ make rpm-parity
```

This command will generate the RPM package inside the `rpmbuild/RPMS` directory.