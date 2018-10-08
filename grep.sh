#!/bin/bash

check_step()
{
  local str
  str=$1
  echo $str | egrep $regexp > /dev/null 2>&1
  if [ $? -ne $2 ]
  then
    echo "FAILED. String: $str   Regexp: $regexp"
  fi
}
regexp='^[[:xdigit:]]{8}-[[:xdigit:]]{4}$|^{[[:xdigit:]]{8}-[[:xdigit:]]{4}}$'
check_step
