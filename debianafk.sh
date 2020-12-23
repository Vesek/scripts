#!/bin/sh
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi
apt install git python
cd /usr/local/share
git clone https://github.com/ammaraskar/pyCraft.git
cat > ~/$3 <<EOF
#!/bin/sh
cd /usr/local/share/pyCraft
python3 start.py -u $1 -p $2 -s simp.majnc.eu:25569
EOF
chmod ~/$3
pip3 install cryptography requests PyNBT
echo Done, run $3 to start the script!
