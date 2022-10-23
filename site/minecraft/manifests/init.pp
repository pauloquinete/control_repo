class minecraft (
  $url = 'https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar',
  $install_dir = '/opt/minecraft',
  $java_package = 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm'
){
  file { $install_dir:
    ensure => directory,
  }
  file { "$(install_dir)/minecraft_server.jar':
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
    source => $java_package,
    provider => 'rpm',
  }
  file {"$(install_dir)/eula.txt":
    ensure  => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    # source => 'puppet:///modules/minecraft/minecraft.service',
    content => epp('minecraft/minecraft.service','{
      install_dir => $install_dir
    })
  }
  service {'minecraft':
    ensure  => running,
    enable => true,
    require => [Package['java'],File["$(install_dir)/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}
