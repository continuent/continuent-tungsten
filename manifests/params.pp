# == Class: tungsten::params See README.md for documentation.
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

class tungsten::params {
	$systemUserName							      = "tungsten"
	
	if $::operatingsystem == "Amazon" {
		$installNTP = false
	} else {
		$installNTP = true
	}

	$defaultSSHPublicKey = "AAAAB3NzaC1yc2EAAAABIwAAAQEAo3LUB/ZA1VCzHKqcZ/bFS0Hh1QyRASYblsRbxAhLlu4mWKsnzOPlbcgCs2mvEcP6K1OFd6VRm5PhjDgclzeQOTl582Ugnzt9Kz6FU9ea5tzkCob+5nEAJnvpbHmm7ZRsQzc5UYq9O5EonQCno7BXHuUcBkb9ZoVXl1oiuaJmDEKM2ynFwoItd0kpclcRQg9LcE3gSOWfwXRxxYrsccLERih3rqYU6PnyQH6cqdU2VgJeVmaRSfK82cEsRTBrUc17hbI5Nii3JiVr33TYXssYxVDkB8TSe3zaEkVvJoKbdWbhRVa4BWDupk3xAyEPaXAOt3eE0pjMpw2KjpBIl8H/Fw=="
	$defaultSSHPrivateCert = "-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAo3LUB/ZA1VCzHKqcZ/bFS0Hh1QyRASYblsRbxAhLlu4mWKsn
zOPlbcgCs2mvEcP6K1OFd6VRm5PhjDgclzeQOTl582Ugnzt9Kz6FU9ea5tzkCob+
5nEAJnvpbHmm7ZRsQzc5UYq9O5EonQCno7BXHuUcBkb9ZoVXl1oiuaJmDEKM2ynF
woItd0kpclcRQg9LcE3gSOWfwXRxxYrsccLERih3rqYU6PnyQH6cqdU2VgJeVmaR
SfK82cEsRTBrUc17hbI5Nii3JiVr33TYXssYxVDkB8TSe3zaEkVvJoKbdWbhRVa4
BWDupk3xAyEPaXAOt3eE0pjMpw2KjpBIl8H/FwIBIwKCAQB+FsDS8SqzL6Adbavb
LBSKg0fQPOTjoQ339o/u/xW9kyTlUNWPbfohfQll1S9IOBjCVl+lcOcu38tASIsV
kUNfWDmBP2JO82CPEvkja89EYUI0Ab1SrvF8xf02bHl1cn9nDVgaVRWi+vNxzU4f
MEM1FyQ/W1XEHbiZVClqodmxrnJCsP3M3FHv8TnxPJ6MGQ8v0GGavv9NLmEjF4rU
fApbaI1NlAxZAp+PiGdcLlA6yrk+Q8KF0BlN5+1T5DU+Mim+sn+gYA/8kuOPFebM
kJN66FDKZfOMh8Lyo7PJ325PIahbMSbuI1xKPEwG+Telj70hhDxZPClhpozlKnJj
OlHDAoGBANniZpZ7j3o3NzOmkpEyINQe0axjJ+ZHNIQKLxxeJrPMMnggivJBha/h
st6pzwPJekXYJMNnl5yleGg4K60bDEp8BNj2UfxFcjraeIvoIcxcqqZ7HQBf1v1F
lIYQnzRHBcYqVOL4dtsy17pq69sobRjm4aAiO4LdsQkSPaJuxMCjAoGBAMAKm2GJ
PWV6z8chRoMhbyq+K7Vfg8PdT6izy4RodofKlGTUNUuJZ2CRxZbUYd2CsLaV1wEh
7o2f4zsSDFNE8fFxSrrOwoA6eYVLgRfMTLMoI8Hbnuu6z/MNau0QM4xWBhF1Y01A
g1lyC5sm3y59W5hZSUqbgRQk2fDFCKmVZcr9AoGASrQF6nOBpj7RGQXpG9asK3hH
41UyQFLtbxlvPO0UlWqU9fyHaQCFm2NTRQcFJd6tlEobO659H8O0QP1QzaLfpIJK
zgtPTy3Aw7ieW9qPPsCviYlLxZ0zxIzidxukTHAfPKDMpZcELeWLyuLUhad13Kbu
RYgUZ2HzjhTh7oxgtxMCgYEAg6+AfWVr7dCOeeruhc3IklaEXxzso5BxIzl1nJ9n
OIrpabYV6qdc1IE3CFceiUOsX/G4AMbPdw6NL9HckN7RyiHM1948OqvBCvHyHvJ9
vK3PYFwVM+3QbCZ1NNfo1UJNTczWYNvHyE4z2Bqnqtmd5M+CttEIDdAgapW8zA6s
M2sCgYEA1M7wGWyErbhuGvXBbFW8Ylph6p1FCvpYv7VL78f6zr2WIO6MEI0qrvkr
j1a+DFw1im8X6ypaIR+3SxeSsJsCM23vhxT/C/jP09fWIEyAYsAF6OKT+k2Y8Dcr
0LUCAYgJh/2TzPA2igJGAIxhxoiriYIfwLFn5cIBpEswLPPeHTA=
-----END RSA PRIVATE KEY-----"
}