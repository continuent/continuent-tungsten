# == Class: tungsten::tungsten::update See README.md for documentation.
#
# Copyright (C) 2014 Continuent, Inc.
# 
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.  You may obtain
# a copy of the License at
# 
#         http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

class tungsten::tungsten::update (
) inherits tungsten::params {
  # Run /opt/continuent/tungsten/tools/tpm update if there is a change to tungsten.ini
	exec { "tungsten::tungsten::update::opt_continuent":
		path => ["/bin", "/usr/bin"],
		command => "sudo -i -u $tungsten::prereq::systemUserName /opt/continuent/tungsten/tools/tpm update --tty > /opt/continuent/service_logs/puppet-update.output 2>&1",
		subscribe => File["/etc/tungsten/tungsten.ini"],
		onlyif => "test -e /opt/continuent/tungsten",
		refreshonly => true
	}
	
	# Run /opt/replicator/tungsten/tools/tpm update if there is a change to tungsten.ini
	exec { "tungsten::tungsten::update::opt_replicator":
		path => ["/bin", "/usr/bin"],
		command => "sudo -i -u $tungsten::prereq::systemUserName /opt/replicator/tungsten/tools/tpm update --tty > /opt/replicator/service_logs/puppet-update.output 2>&1",
		subscribe => File["/etc/tungsten/tungsten.ini"],
		onlyif => "test -e /opt/replicator/tungsten",
		refreshonly => true
	}
}