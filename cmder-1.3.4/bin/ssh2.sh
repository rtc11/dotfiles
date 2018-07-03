#!/usr/bin/expect -f
spawn ssh $1
expect "assword:"
send "imusedtodeploystuff\r"
interact