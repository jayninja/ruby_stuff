Name: random_chars	
Version: 1.0	
Release: 1
Summary: spits out 100 random characters in a string

Group: Tools	
License: GPL
URL: http://www.fazey.org	
Source0: random_chars.tar.gz

Requires: ruby	

%description
spits out 100 random characters in a string

%prep
%setup -q -n random_chars

%install
mkdir -p $RPM_BUILD_ROOT/usr/bin
cp random_chars.rb $RPM_BUILD_ROOT/usr/bin/random_chars


%files
/usr/bin/random_chars


%changelog

