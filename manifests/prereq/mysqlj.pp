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
#		http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class continuent_install::prereq::mysqlj (
	$enabled = true ,
    $location = false,
) {
	if $enabled == true {
		file { "/opt/mysql":
			ensure => "directory",
			owner	=> "tungsten",
			group	=> "tungsten",
			mode	 => 750,
			require => User['tungsten'],
		}

		file { '/opt/mysql/mysql-connector-java-5.1.26-bin.jar':
			ensure => file,
			mode	 => 644,
			owner	=> "tungsten",
			group	=> "tungsten",
			source => 'puppet:///modules/continuent_install/connectorj/mysql-connector-java-5.1.26-bin.jar',
		}
		
		$mysqljLocation = "/opt/mysql/mysql-connector-java-5.1.26-bin.jar"
	} else {
		$mysqljLocation = $location
	}
}