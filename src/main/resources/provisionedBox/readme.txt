* See the NOTICE file distributed with this work for additional
* information regarding copyright ownership.
*
* This is free software; you can redistribute it and/or modify it
* under the terms of the GNU Lesser General Public License as
* published by the Free Software Foundation; either version 2.1 of
* the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public
* License along with this software; if not, write to the Free
* Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
* 02110-1301 USA, or see the FSF site: http://www.fsf.org.
*

This directory contains package.box which is the provisioned VM
In order to use the VM, you have to do the following steps:
1) go to target/provisionedBox folder
2) "vagrant box add ${provisionedBoxName} package.box" (this command will install package.box in ./vagrant.d/boxes and make it available for use)
3) "vagrant init ${provisionedBoxName}" (Optional, since the build already provides a configured Vagrantfile)
4) "vagrant up"
5) "ssh -l xwiki ${provisionedBoxIPAddress}" with password "xwiki" to connect to the VM via ssh using  or if it does not work, use "vagrant ssh"
6) enjoy
