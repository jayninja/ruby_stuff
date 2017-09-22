## lookup creation time

I was trying to figure out the creation time of a file. It turns out that stat doesnt actually show that in ext[2-4].  
Instead of doing some lame debugfs commands, I figured let me just write something real fast that takes a file, and outputs the creation time.


