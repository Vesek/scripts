#!/bin/sh
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi
apt install git python
git clone https://github.com/ammaraskar/pyCraft.git
cat > afkstart <<EOF
#!/bin/sh
cd ~/pyCraft
python3 start.py -u $1 -p $2 -s simp.majnc.eu:25569
EOF

