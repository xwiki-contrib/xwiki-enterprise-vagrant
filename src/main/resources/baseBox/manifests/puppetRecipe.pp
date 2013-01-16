# See the NOTICE file distributed with this work for additional
# information regarding copyright ownership.
#
# This is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as
# published by the Free Software Foundation; either version 2.1 of
# the License, or (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this software; if not, write to the Free
# Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
# 02110-1301 USA, or see the FSF site: http://www.fsf.org.


group { "puppet":
    ensure=>"present",
   }
## Set the MOTD
File { owner => 0, group => 0, mode => 0644 }
file { '/etc/motd':
    content=>"Welcome to your XWiki Vagrant VM ! Machine name is ${provisionedBoxName}.\n"
}
# Set the /etc/hostname
file { '/etc/hostname':
    content=>"${provisionedBoxName}\n"
}
# Needed to add the hostname to /etc/hosts
host { "${provisionedBoxName}":
    ip=>'127.0.0.1',
}
package { 'unzip'             :
    ensure=>installed}
# Needed by puppet to be able to set the password hash in /etc/shadow
package { 'libshadow-ruby1.8' : 
    ensure=>installed,
    before=>User["xwiki"],
}

user{"xwiki":
    ensure=>present,
    home=>"/home/xwiki/",
    managehome=>'true',
    # Add username xwiki to sudoers list
    groups=>["sudo"],
    shell=>"/bin/bash",
    # password is xwiki
    password=>'$6$KfS1N2yF$Gml4kubxSiaetWQC77DTAAyNQRC02ik2MS95ifR1aRuFSgGRS9VVQhbjkpjEi0W6/gdFc7PYq5M7aLlTTbqBW1',
}

