# Set up regular Puppet runs
file { '/usr/local/bin/run-puppet':
  source => '/etc/puppetlabs/code/environments/production/files/run-puppet.sh',
  mode   => '0755',
}

file { '/etc/puppetlabs/code/environments/testfileresource.txt':
  ensure => file,
  content => "whatever should\ngo here\nwill be sufficient\n"
}

file { '/etc/motd':
  source => '/examples/puppet/files/motd.txt',
}

cron { 'run-puppet':
  command => '/usr/local/bin/run-puppet',
  hour    => '*',
  minute  => '*/5',
}
