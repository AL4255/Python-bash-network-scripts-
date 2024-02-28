#!bin/bash 


#Settings
NETWORK_PREFIX="192.168.1." #Adjust this to match the nework IP
SUBNET_MASK="/24"

# Ping sweep to find Hosts on the nework
for i in {1..254}; do  #a/24 subnet 
    ping -c 1 "$NETWORK_PREFIX$i" > /dev/null & #Background ping for speed
 done


wait #Wait for pings to finsih

#Displays results 
echo "Active Hosts:"
arp -a | grep "$NETWORK_PREFIX" #Cleanly list IP and MAC addresses 

#After getting this Hosts still we will run nmap
echo "Running basic nmap scan ....."
nmap -sn "$NETWORK_PREFIX$SUBNET_MASK"