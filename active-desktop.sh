#!/bin/bash

wmctrl -d | grep "*" | awk '{print $1}'
