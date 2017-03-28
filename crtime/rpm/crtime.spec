Name: crtime	
Version: 1.0	
Release: 1
Summary: A script to tell you creation time of a file

Group: System/Utilities	
License: GPL
URL: http://www.fazey.org
Source0: crtime.tar.gz

Requires: ruby	

%description
A script to tell you creation time of a file

%prep
%setup -q -n crtime

%install
mkdir -p $RPM_BUILD_ROOT/usr/sbin
cp crtime.rb $RPM_BUILD_ROOT/usr/sbin/crtime


%files
/usr/sbin/crtime


%changelog

