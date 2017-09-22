## lookup creation time

I was trying to figure out the creation time of a file. It turns out that stat doesnt actually show that in ext[2-4].  
You have to first look up where the file system is mounted, and then call debugfs. At the time, I was doing it often enough to where it was getting annoying. So I threw this little bad boy together to make it all happen in one motion.  
  


