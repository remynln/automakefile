#!/bin/bash

if [[ $# -ne 1 ]]; then
    exit 84
fi

awk '{print $3,"\t",$9}' | grep \ $1