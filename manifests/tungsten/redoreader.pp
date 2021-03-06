# == Class: tungsten::tungsten::replicator See README.md for documentation.
#
# Copyright (C) 2015 VMware Inc.
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

class tungsten::tungsten::redoreader (
	$location = false,
) inherits tungsten::params {
	include tungsten::prereq

	  case fileextension($location) {
	    ".rpm": {
	      # Install the tungsten-replicator package from the provided location
    		Class["tungsten::prereq"] ->
    		package { "vmware-continuent-replication-oracle-source":
    			ensure => present,
    			provider => rpm,
    			source => $location,
    		}
	    }
	    ".gz": {
	      # Get the true basename of the file in case it is a .tar.gz file
	      if fileextension(filebasename($location)) == ".tar" {
	        $basename = filebasename(filebasename($location))
	        $arguments = "zxf"
	      } else {
	        $basename = filebasename($location)
	        $arguments = "xf"
	      }

	      # Unpack the tungsten-replicator package from the provided location
	      Class["tungsten::prereq"] ->
    		exec { "unpack-redo-reader":
    		  path => ["/bin", "/usr/bin"],
    		  cwd => "/opt/continuent/software",
    		  command => "tar $arguments $location",
    		  user => $tungsten::prereq::systemUserName,
    			creates => "/opt/continuent/software/$basename",
    		} ~>
    		exec { "install-redo-reader":
    		  path => ["/bin", "/usr/bin"],
    		  command => "sudo -i -u $tungsten::prereq::systemUserName /opt/continuent/software/$basename/tools/tpm install --tty ",
    		  onlyif => "test -f /etc/tungsten/tungsten.ini",
					logoutput => true,
      		refreshonly => true,
      		returns => [0, 1],
    		}
	    }
    	default: {
    	  fail("Unable to install the Redo Reader from $location because the file type is not recognized.")
    	}
	  }

}
