#!/bin/sh
git symbolic-ref HEAD | cut -d'/' -f3
