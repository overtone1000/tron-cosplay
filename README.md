# Tron Cosplay

## Sources
* Disc from https://www.thingiverse.com/thing:1032216
* Disc base from https://www.thingiverse.com/thing:1083616

## 3D Printer Monitoring
* Configured the pi zero to run [_Motion_](https://motion-project.github.io/) to view the print as it works. 
* Changes to config file at `/etc/motion/motion.conf` to allow network streaming:
```
daemon on
stream_localhost off
stream_maxrate 50
framerate 60
width 1920
height 1040
stream_quality 25
on_event_end /home/pi/print_done.sh
```

The `/home/pi/print_done.sh` file must be placed. The script is very simple:
```
#!/bin/bash
IFTTT_KEY="YOUR_KEY"
ACTION_NAME="YOUR_ACTION_NAME"
HOOK="https://maker.ifttt.com/trigger/$ACTION_NAME/with/key/$IFTTT_KEY"
curl -X POST $HOOK
```

Get it running with `systemctl start monitor`
Troubleshoot with `cat /var/log/motion/motion.log`