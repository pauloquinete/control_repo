class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDAvTlsPx/J4UCOpNKMguOiJLKUKLF1YzMqZVVrKap5724vCDbPjfBBFsm+DUBR//DRZXRxb4ILjlmlCzniFwp3/VtkN4oO9Y38dloJRAEJAk1QtmHpmoLavE7FXSBXm8nsFvtIEyuPDrYm1WYytnxQb3tdrVVSsOyiRuADv5t4CJLcC44+aeS0PjMZqkFHHqK27jTFCfoIaZwZRvJ9wbhT+Is+mclshLiDpzhYDVp83pG1oTz2FZgKnx12PXT+aB15YhdLE2Eg5Kiaq2c0e86+VuIpXgsafRngh6X4vc8ksQCd4NPHo0Jd1uYYDKUZ+FctKykqxlMNfU2WhHaEzRjb',
	}  
}
