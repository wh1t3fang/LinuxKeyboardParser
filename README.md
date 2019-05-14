# LinuxKeyboardParser
ruby parser for Linux input devices to see which keys were pressed and released at a given time.  This demonstrates how simple it would be to install a keylogger if you have escalated to root priveleges.  
This will allow you to take a Linux keyboard input device such as reading from /dev/input/event0 or reading from the saved output of the /dev/input/event0 file and interpret what keys were pressed without having to go through the manuel work of reading each input code that corresponds to each letter on the keyboard from here  https://github.com/torvalds/linux/blob/master/include/uapi/linux/input-event-codes.h .  

Forked from https://gist.github.com/movitto/a2f62966cd8f83c5d2acfa31879b2442  

https://stackoverflow.com/questions/5060710/format-of-dev-input-event  
