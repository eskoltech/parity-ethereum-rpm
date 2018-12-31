# Parity Ethereum RPM package

[![License](https://img.shields.io/badge/License-GPLv3%202.0-brightgreen.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0) [![Build Status](https://img.shields.io/travis/com/eskoltech/parity-ethereum-rpm/develop.svg?style=for-the-badge)](https://travis-ci.com/eskoltech/parity-ethereum-rpm)

Build an RPM package for the Parity Ethereum latest stable client. This RPM package installs Parity Ethereum as a `systemd` service.

If you want to install the latest Parity Ethereum stable release, you can use the next one line command:

```bash
rpm -i https://github.com/eskoltech/parity-ethereum-rpm/releases/download/v0.1.1/parity-2.1.10-1.el7.x86_64.rpm
```

Note that this command will install `parity` inside the `/usr/sbin` directory, and two configuration files will be created:

* The `parity.service` file inside the `/usr/lib/systemd/system` folder. This file will be responsible to manage the Parity Ethereum systemd service.
* The `config.toml` file for the Parity Ethereum client configuration. Normally, you always edit this file for configuration changes.

>**Important**: When you start the client, for default it will try to connect to the *Ethereum Ropsten* network. You can change the network inside the `config.toml` file. The rest of the configurations are the default ones.

Now you can start the Parity Ethereum client using `systemctl start parity.service`, and view the logs with the command `journalctl -u parity.service -f`.

See the next sections if you want to build the RPM package by yourself.

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