# configure users

class basedefault::user {
  include sshkeys

  user { 'deploy':
      ensure           => 'present',
      home             => '/home/deploy',
      purge_ssh_keys   => true,
      comment          => 'Deployment user',
      password         => '!!',
      shell            => '/bin/bash',
      keys             => ('alice','bob','charlie'),
  }

  # $myusers = hiera('sshkeys::users')
  # create_resources(user, $myusers)

}