# === Copyright
#
# Copyright 2013 Continuent Inc.
#
# === License
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class { 'continuent_install' :
  hostsFile                  => ["192.168.11.101 db1.vagrant",'192.168.11.102 db2.vagrant','192.168.11.103 db3.vagrant',
  '192.168.11.104 db4.vagrant','192.168.11.105 db5.vagrant','192.168.11.106 db6.vagrant'],

  clusterData                => {
  east => { 'members' => 'db1.vagrant,db2.vagrant,db3.vagrant', 'connectors' => 'db1.vagrant,db2.vagrant,db3.vagrant', 'master' => 'db1.vagrant' },
  west => { 'members' => 'db4.vagrant,db5.vagrant,db6.vagrant', 'connectors' => 'db4.vagrant,db5.vagrant,db6.vagrant', 'master' => 'db4.vagrant' ,'relay-source'=> 'east'},
  north => { 'members' => 'north-db1,north-db2', 'connectors' => 'north-db1,north-db2', 'master' => 'north-db1' ,'relay-source'=> 'east'},
  } ,
  compositeName              => 'world' ,
installClusterSoftware            => "/vagrant/ct.rpm",
  installMysql => true        ,

}
