#!/bin/bash

for i in $(grep "Failed" auth.log | awk '{print $4}' | sort | uniq); do
  count=$(grep "Failed" auth.log | grep "$i" | wc -l)
  login=$(grep "Accepted" auth.log | grep "$i" | wc -l)
  sudo=$(grep "executed" auth.log | grep "$i" | wc -l)

  if [ "$count" -gt 1 ] && [ "$login" -gt 0 ] && [ "$sudo" -gt 0 ]; then
    echo "--------------------------"
    echo "$i is suspicious"
    echo "Failed attempts: $count"
    echo "Successful login: yes"
    echo "Privilege escalation detected"
  fi
done

