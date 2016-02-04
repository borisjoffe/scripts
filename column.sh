#!/bin/bash

column_number=$1
shift
awk $@ '{print $'$column_number'}'
