#!/bin/bash

if [ "$OSTYPE" -eq "linux-gnu" ]
then
  fc-cache -vf ~/.fonts
else
  echo "ask Google!"
fi


