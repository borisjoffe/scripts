#!/bin/sh

connmanctl enable wifi
connmanctl scan wifi
connmanctl disable ethernet
sleep 2
connmanctl state
