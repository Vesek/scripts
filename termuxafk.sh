#!/bin/sh
if [ -d "~/pyCraft" ] 
then
    (cd ~/pyCraft && git fetch) 
else
    git clone https://github.com/ammaraskar/pyCraft.git ~/pyCraft
fi
pkg install git python
cat > ~/../usr/bin/$3 <<EOF
#!/bin/sh
cd ~/pyCraft
python3 start.py -u $1 -p $2 -s simp.majnc.eu:25569
EOF
chmod +x ~/../usr/bin/$3
pip3 install cryptography requests PyNBT
echo Done, run $3 to start the script!
