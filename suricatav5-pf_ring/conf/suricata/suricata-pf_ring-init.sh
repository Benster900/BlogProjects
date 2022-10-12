#!/bin/sh -e
#
# /etc/init.d/suricata
#
### BEGIN INIT INFO
# Provides:          suricata
# Required-Start:    $time $network $local_fs $remote_fs
# Required-Stop:     $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Next Generation IDS/IPS
# Description:       Intrusion detection system that will
#                    capture traffic from the network cards and will
#                    match against a set of known attacks.
### END INIT INFO

. /lib/lsb/init-functions

# Source function library.
if test -f /etc/default/suricata; then
    . /etc/default/suricata
else
    echo "/etc/default/suricata is missing... bailing out!"
fi

# We'll add up all the options above and use them
NAME=suricata
DAEMON=/usr/bin/$NAME

if [ -z "$RUN_AS_USER" ]; then
    USER_SWITCH=
  else
    USER_SWITCH=--user=$RUN_AS_USER
fi



# Use this if you want the user to explicitly set 'RUN' in
# /etc/default/
if [ "x$RUN" != "xyes" ] ; then
    log_failure_msg "$NAME disabled, please adjust the configuration to your needs "
    log_failure_msg "and then set RUN to 'yes' in /etc/default/$NAME to enable it."
    exit 0
fi

check_root()  {
    if [ "$(id -u)" != "0" ]; then
        log_failure_msg "You must be root to start, stop or restart $NAME."
        exit 4
    fi
}

check_nfqueue() {
if [ ! -e /proc/net/netfilter/nf_queue ] && [ ! -e /proc/net/netfilter/nfnetlink_queue ]; then
    log_failure_msg "NFQUEUE support not found !"
    log_failure_msg "Please ensure the nfnetlink_queue module is loaded or built in kernel"
    exit 5
fi
}

check_run_dir() {
    if [ ! -d /var/run/suricata ]; then
	mkdir /var/run/suricata
    if  [ ! -z "$RUN_AS_USER" ]; then
        chown $RUN_AS_USER /var/run/suricata;
    fi
	chmod 0755 /var/run/suricata
    fi
}



check_root

case "$LISTENMODE" in
  nfqueue)
    IDMODE="IPS (nfqueue)"
    LISTEN_OPTIONS=" $NFQUEUE"
    check_nfqueue
    ;;
    custom_nfqueue)
    IDMODE="IPS (custom multi-nfqueue)"
    LISTEN_OPTIONS=" $CUSTOM_NFQUEUE"
    check_nfqueue
    ;;
  pcap)
    IDMODE="IDS (pcap)"
    LISTEN_OPTIONS=" -i $IFACE"
    ;;
  af-packet)
    IDMODE="IDS (af-packet)"
    LISTEN_OPTIONS=" --af-packet"
    ;;
  pfring)
    IDMODE="IDS (pf_ring)"
    LISTEN_OPTIONS=" --pfring"
    ;;
  *)
    echo "Unsupported listen mode $LISTENMODE, aborting"
    exit 1
    ;;
esac

SURICATA_OPTIONS=" -c $SURCONF --pidfile $PIDFILE $LISTEN_OPTIONS -D -vvv $USER_SWITCH"

# See how we were called.
case "$1" in
  start)
       if [ -f $PIDFILE ]; then
           PID1=`cat $PIDFILE`
           if kill -0 "$PID1" 2>/dev/null; then
               echo "$NAME is already running with PID $PID1"
               exit 0
           else
               echo "Likely stale PID `cat $PIDFILE` with $PIDFILE exists, but process is not running!"
               echo "Removing stale PID file $PIDFILE"
               rm -f $PIDFILE
           fi
       fi
       check_run_dir
       echo -n "Starting suricata in $IDMODE mode..."
       $DAEMON $SURICATA_OPTIONS > /var/log/suricata/suricata-start.log  2>&1 &
       echo " done."
       ;;
  stop)
       echo -n "Stopping suricata: "
       if [ -f $PIDFILE ]; then
           PID2=`cat $PIDFILE`
       else
           echo " No PID file found; not running?"
           exit 0;
       fi
       start-stop-daemon --oknodo --stop --quiet --pidfile=$PIDFILE --exec $DAEMON
       if [ -n "$PID2" ]; then
           kill "$PID2"
           ret=$?
           sleep 2
           if kill -0 "$PID2" 2>/dev/null; then
               ret=$?
               echo -n "Waiting . "
               cnt=0
               while kill -0 "$PID2" 2>/dev/null; do
                   ret=$?
                   cnt=`expr "$cnt" + 1`
                   if [ "$cnt" -gt 10 ]; then
                      kill -9 "$PID2"
                      break
                   fi
                   sleep 2
                   echo -n ". "
               done
           fi
       fi
       if [ -e $PIDFILE ]; then
           rm $PIDFILE > /dev/null 2>&1
       fi
       echo " done."
    ;;
  status)
       # Check if running...
       if [ -s $PIDFILE ]; then
           PID3=`cat $PIDFILE`
           if kill -0 "$PID3" 2>/dev/null; then
               echo "$NAME is running with PID $PID3"
               exit 0
           else
               echo "PID file $PIDFILE exists, but process not running!"
           fi
       else
          echo "$NAME not running!"
       fi
    ;;
  restart)
        $0 stop
        $0 start
    ;;
  force-reload)
        $0 stop
        $0 start
    ;;
  *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
esac

exit 0
