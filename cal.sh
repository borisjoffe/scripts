#!/bin/bash
cal | sed "s/^/ /;s/$/ /;s/ $(date +%e) / $(date +%e | sed 's/./#/g') /"
