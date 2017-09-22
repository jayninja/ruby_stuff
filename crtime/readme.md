## lookup creation time

I was trying to figure out the creation time of a file. It turns out that stat doesnt actually show that, even though the information is there on an ext[2-4] filesystem.

So, to find it, you have to first look up where the file system is mounted, and then call debugfs on that device. This little bad boy makes it all happen in one motion. 


  


