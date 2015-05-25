#!/bin/bash
#set -x
installed_version=`VBoxManage --version|cut -f 1 -d 'r'`

latest_version=`curl -s http://download.virtualbox.org/virtualbox/LATEST.TXT`

if [ ${installed_version} != ${latest_version} ]
then
rpm=`curl -sL http://download.virtualbox.org/virtualbox/${latest_version}|grep 'fedora18-1.x86_64.rpm'|awk -F '"' '{print $2}'`
sudo yum install -y http://download.virtualbox.org/virtualbox/${latest_version}/${rpm}
fi

