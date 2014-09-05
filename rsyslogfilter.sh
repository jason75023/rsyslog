#!/bin/bash
#######################################################################
## This script is to install rsyslog                                  ##
## Version 2                                                         ##
## created by TimRoush on Aug 26, 2014                               ##
#######################################################################
  LINE="##############################################################################"
  sed -i.bak '/^*.*/d' /etc/rsyslog.conf
  echo "$LINE"
  sed -i '1i :msg, contains, "WARN" ~' /etc/rsyslog.conf
  sed -i '2i :msg, contains, "DEBUG" ~' /etc/rsyslog.conf
  sed -i '3i :msg, contains, "INFO" ~' /etc/rsyslog.conf
  sed -i '4i :msg, contains, "update" ~' /etc/rsyslog.conf
  sed -i '5i #:msg, contains, "failed" ~' /etc/rsyslog.conf
  sed -i '6i #:msg, contains, "EMERG" ~' /etc/rsyslog.conf
  sed -i '7i #:msg, contains, "PANIC" ~' /etc/rsyslog.conf
  sed -i '8i #:msg, contains, "ALERT" ~' /etc/rsyslog.conf
  sed -i '9i #:msg, contains, "CRIT" ~' /etc/rsyslog.conf
  sed -i '10i #:msg, contains, "ERR" ~' /etc/rsyslog.conf
  echo " " >> /etc/rsyslog.conf
  hostn=$( hostname )
  echo "$hostn"
  echo "*****Configure rsyslog on client servers with(Centos/RedHat) OS****"
  echo "$LINE"
  echo " " >> /etc/rsyslog.conf
  echo "*.* @192.168.2.23:514" >> /etc/rsyslog.conf 
  echo "$LINE"
  echo "**** Start or Restart rsyslog****************"
  /etc/init.d/rsyslog start
  /etc/init.d/rsyslog restart 
  echo "$LINE"
  echo "$hostn"
  egrep -v '^#|^$' /etc/rsyslog.conf -v
