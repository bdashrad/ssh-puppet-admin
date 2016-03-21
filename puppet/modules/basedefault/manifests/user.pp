# configure users

class basedefault::user {
  include sshkeys

  file { '/home/deploy':
    ensure => directory,
    owner => 'deploy',
    group => 'deploy'
  }

  user { 'deploy' :
      ensure           => 'present',
      home             => '/home/deploy',
      comment          => 'Deployment user',
      password         => '!!',
      shell            => '/bin/bash',
      purge_ssh_keys   => true,
      # keys             => ( 'alice', 'bob', 'charlie' ),
  }

  sshkeys::key { 'alice-key':
    key_name => 'alice',
    user     => 'deploy',
  }

  sshkeys::key { 'bob-key':
    key_name => 'bob',
    user     => 'deploy',
  }

  sshkeys::key { 'charlie-key':
    key_name => 'charlie',
    user     => 'deploy',
  }

  # $myusers = hiera('sshkeys::users')
  # create_resources(user, $myusers)

}