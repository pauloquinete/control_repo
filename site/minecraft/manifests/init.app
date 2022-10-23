class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar',
  }
  package {'java':
    ensure => present,
    source => 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm',
    provider => 'rpm',
  }
  file {'/opt/minecraft/eula.txt':
    ensure  => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure  => running,
    enabled => true,
  }
}
