Name:          parity
Version:       2.1.10
Release:       0%{?dist}
Summary:       The fast, light, and robust EVM and WASM client.

Group:         TecAdmin
ExclusiveArch: x86_64
License:       GPLv3
URL:           https://github.com/paritytech/parity-ethereum
Source0:       %{name}-%{version}.tar.gz
AutoReq:       no

%description
Parity Ethereum's goal is to be the fastest, lightest, and most secure Ethereum client. 
We are developing Parity Ethereum using the sophisticated and cutting-edge Rust programming 
language. Parity Ethereum is licensed under the GPLv3 and can be used for all your Ethereum 
needs.

%prep
%setup -q

%build

%install
install -m 0755 -d $RPM_BUILD_ROOT/var/parity
install -m 0755 -d $RPM_BUILD_ROOT/%{_sbindir}
install -m 0755 -d $RPM_BUILD_ROOT/%{_prefix}/%{_lib}/systemd/system

install -m 0644 config.toml $RPM_BUILD_ROOT/var/parity/config.toml
install -m 0755 parity $RPM_BUILD_ROOT/%{_sbindir}/parity
install -m 0644 parity.service $RPM_BUILD_ROOT/%{_prefix}/%{_lib}/systemd/system/parity.service

%files
/var/parity/config.toml
%{_prefix}/%{_lib}/systemd/system/parity.service
%{_sbindir}/%{name}

%changelog
* Fri Dec 28 2018 Javier Casanova <nhitbh@gmail.com>
- Initial Parity RPM release