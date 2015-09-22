#!/bin/bash

eval $(keychain --eval --agents ssh -Q --quiet $HOME/.ssh/id_rsa)
