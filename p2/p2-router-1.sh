

# create link called br0 on type bridge
/sbin/ip link add br0 type bridge
# up the device created (br0)
/sbin/ip link set dev br0 up
# add  ip to routing table of the router
/sbin/ip addr add 10.1.1.1/24 dev eth0

# set Vxlan and encapsulation
# Unicast
/sbin/ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.2 local 10.1.1.1 dstport 4789

# Multicast
#/sbin/ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789

# add router ip to vxlan routing table (after encapsulation)
/sbin/ip addr add 20.1.1.1/24 dev vxlan10

# up the device vxlan10 / cmd : ip -d link show vxlan10
/sbin/ip link set dev vxlan10 up

# brctl (bridge control) add interfaces eth1 to the bridge set above
# and to the vxlan10
brctl addif br0 eth1
brctl addif br0 vxlan10
