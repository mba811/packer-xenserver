#!/bin/bash

for i in xapi xenopsd xenopsd-xl xenopsd-xc xcp-rrdd-plugins xcp-rrdd xcp-networkd xapi-domains squeezed firstboot forkexecd genptoken perfmon; do
  chkconfig $i off || true
  service $i stop || true
done

cat > /etc/sysconfig/network-scripts/ifcfg-eth0 <<EOF
DEVICE=eth0
BOOTPROTO=dhcp
ONBOOT=yes
EOF

chkconfig network on

