# ruby stuff
Various tools written in native ruby. Some useful, some just for funsies. 



# building the rpm
My rpms follow a pattern. Git clone the repo, then do the following:  

tar -zcvf $project_name.tar.gz $project_name  
mv $project_name.tar.gz ~/rpmbuild/SOURCES/  
rpmbuild -bb $project_name/rpm/$project_name.spec  
  
where $project_name is a project like pscan.
