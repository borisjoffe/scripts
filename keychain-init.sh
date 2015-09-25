#!/bin/bash

eval $(keychain --eval --agents ssh -Q --quiet $HOME/.ssh/id_rsa)
#eval $(ssh-agent)
#ssh-add $HOME/.ssh/id_rsa
