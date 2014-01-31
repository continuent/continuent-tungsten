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
class continuent_install::mysql_sandbox(
	$sandboxVersion	= $continuent_install::mysql_sandbox::params::sandboxVersion
) inherits continuent_install::mysql_sandbox::params {
	include continuent_install::prereq
	
	Class["continuent_install::prereq"] ->
	package {'make': ensure => present, } ->
	package {'perl-ExtUtils-MakeMaker': ensure => present, } ->
	exec { "download-sandbox":
		cwd => "/tmp",
		command => "/usr/bin/wget https://launchpad.net/mysql-sandbox/mysql-sandbox-3/mysql-sandbox-3/+download/MySQL-Sandbox-${sandboxVersion}.tar.gz",
		creates => "/tmp/MySQL-Sandbox-${sandboxVersion}.tar.gz",
	} ->
	exec { "unpack-sandbox":
		cwd => "/tmp",
		command => "/bin/tar xvzf /tmp/MySQL-Sandbox-${sandboxVersion}.tar.gz",
		creates => "/tmp/MySQL-Sandbox-${sandboxVersion}",
	} ->
	exec { "install-sandbox":
		cwd => "/tmp/MySQL-Sandbox-${sandboxVersion}",
		command => "/usr/bin/perl Makefile.PL ; /usr/bin/make ; /usr/bin/make install",
		creates => "/usr/local/bin/make_sandbox",
	}
}