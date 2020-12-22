#!/bin/sh
cd ~
pkg install git python
git clone https://github.com/ammaraskar/pyCraft.git
cat > ~/../usr/bin/$3 <<EOF
#!/bin/sh
cd ~/pyCraft
python3 start.py -u $1 -p $2 -s simp.majnc.eu:25569
EOF
chmod +x ~/../usr/bin/$3
