#!/bin/sh

connmanctl enable ethernet
connmanctl disable wifi
sleep 2
connmanctl state
