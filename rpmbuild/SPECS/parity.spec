Name:    parity
Version: 2.1.10
Release: 0
Summary: The fast, light, and robust EVM and WASM client.

Group:     TecAdmin
BuildArch: x64
License:   GPLv3
URL:       https://github.com/paritytech/parity-ethereum
Source0:   %{name}-%{version}.tar.gz

%description
Parity Ethereum's goal is to be the fastest, lightest, and most secure Ethereum client. 
We are developing Parity Ethereum using the sophisticated and cutting-edge Rust programming 
language. Parity Ethereum is licensed under the GPLv3 and can be used for all your Ethereum 
needs.

%prep
%setup -q

%build
%configure

%install
install -m 0755 -d $RPM_BUILD_ROOT/.local/parity
install -m 0644 parity-config.toml $RPM_BUILD_ROOT/.local/parity/config.toml
install -m 0755 parity $RPM_BUILD_ROOT/usr/local/bin/parity

%files
~/.local/parity
~/.local/parity/config.toml
/usr/local/bin/parity

%changelog
* Fri Dec 28 2018 Javier Casanova <nhitbh@gmail.com>
- Initial Parity RPM release