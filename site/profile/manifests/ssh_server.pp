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
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+DaD34PQGJ0RB21SzsC+01UbwnAbUctiAz94/k8TccJY2i6bBrkDL8o2J9jEHTSGQhhKPkwQb29+o3KWHB1B/nTT0SuMoya/3Bu9yPSopKWF010J1vz2n2sRocCkWHfY9ziD9/P+Wr/nH50oevxPq+exBqnznYHnvpPfkpR3zXUXsTuYRjiBJI/Wlk/jswIYptIhvExeCmo9hV+BplQMu6f98MZtL/8U9nd5bBmDItHPhAbwjkLx1MznvqeTrxdKov6SZu6CyhhFjCCM3nX2WINkbTRy2LX82o8g1izMmipADvYsCuGlqdR+3/GlriEtG4vE52aRXKFfGWVaa5usj',
	}  
}
