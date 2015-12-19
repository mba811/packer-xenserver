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

CENTOS_VERSION=`rpm -q centos-release --qf %{version}`

if [ $CENTOS_VERSION -eq '5' ]; then
   rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm
   yum install -y --enablerepo=base --disablerepo=citrix git-core
else 
   yum install -y --enablerepo=base --disablerepo=citrix git
fi
cd /home/vagrant

git clone git://github.com/jonludlam/vagrant-xenserver-scripts
