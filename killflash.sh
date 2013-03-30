#/bin/bash

#ps augx|grep plugin-container |grep flash | awk '{"kill -9" $2}' | sh
kill `ps augx|grep flash|grep plugin-container|awk '{ print $2 }'`
