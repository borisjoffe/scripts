echo "Killing network manager and network manager applet..."
killall -15 nm-applet
killall -15 NetworkManager
echo "Done killing processes.\nShutting down eth0 interface..."
ifdown eth0
echo "Done\nRestarting eth0 interface..."
ifup eth0
echo "Done."
