#!/bin/bash
# Convert hosts -> ios commands
grep -E '^[0-9]' hosts | \
awk '{
  ip = ($1=="0.0.0.0" ? "127.0.0.1" : $1)
  for(i=2;i<=NF;i++){
    if($i ~ /#/ ) break
    print "ip host " $i " " ip
  }
}' > cisco_hosts.txt
