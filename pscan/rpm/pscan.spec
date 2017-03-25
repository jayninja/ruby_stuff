Name: pscan		
Version: 1.0	
Release: 1
Summary: A ruby port scanner.

Group: System/Utilities	
License: GPL
URL: http://www.fazey.org	
Source0: pscan.tar.gz

Requires: ruby	

%description
A ruby port scanner

%prep
%setup -q -n pscan

%install
mkdir -p $RPM_BUILD_ROOT/usr/bin
cp bin/pscan.rb $RPM_BUILD_ROOT/usr/bin/pscan


%files
/usr/bin/pscan


%changelog

