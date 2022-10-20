node default {
  file {'/root/REAMDE':
    ensure  => file,
    content => 'This is a readme',
    owner   => 'root',
  }
  file {'/root/REAMDE':
    owner   => 'root',
  }
}
