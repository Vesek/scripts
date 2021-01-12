#!/bin/sh
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi
apt install git python3 python3-pip
if [ -d "~/.local/share/pyCraft" ] 
then
    (cd ~/.local/share/pyCraft && git fetch) 
else
    git clone https://github.com/ammaraskar/pyCraft.git ~/.local/share/pyCraft
fi
cat > /usr/bin/$3 <<EOF
#!/bin/sh
cd ~/.local/share/pyCraft
python3 start.py -u $1 -p $2 -s simp.majnc.eu:25569
EOF
chmod +x /usr/bin/$3
pip3 install cryptography requests PyNBT
echo Done, run $3 to start the script!
