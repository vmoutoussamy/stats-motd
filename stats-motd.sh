#!/bin/bash

echo -e "
\033[0;35m+++++++++++++++++: \033[0;38mSystem Data\033[0;35m :+++++++++++++++++++
+  \033[0;38mHostname \033[0;35m= \033[1;32m`hostname`
\033[0;35m+    \033[0;38mKernel \033[0;35m= \033[1;32m`uname -r`
\033[0;35m+    \033[0;38mUptime \033[0;35m= \033[1;32m`uptime | sed 's/.*up ([^,]*), .*/1/'`
\033[0;35m+++++++++++++++++: \033[0;38mMemory\033[0;35m :+++++++++++++++++++
\033[1;32m`free -k | {
  read ; read TITLE TOTAL USED FREE SHARED BUFFERS CACHED
  echo "Memory Usage: $(( 100 * ($TOTAL - $FREE - $BUFFERS - $CACHED) / $TOTAL ))%"

  read ; read TITLE TOTAL USED REST
  echo "Swap Usage: $(( 100 * $USED / $TOTAL ))%"
}`
\033[0;35m++++++++++++++++++: \033[0;38mDisks\033[0;35m :++++++++++++++++++++
+  \033[1;32m`df -h | egrep -v 'tmpfs|.snapshots' | awk '{print $1,$5,$6}' | column -t`
\033[0;35m++++++++++++++++++: \033[0;38mZombies\033[0;35m :++++++++++++++++++++
\033[0;32m`ps -el | grep Z | grep -v WCHAN`
"
