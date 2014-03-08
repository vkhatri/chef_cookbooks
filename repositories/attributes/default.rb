default['repositories'] = {
  'arch' => {},
  'debian' => {},
  'fedora' => {},
  'gentoo' => {},
  'mac_os_x' => {},
  'openbsd' => {},
  'rhel' => {},
  'slackware' => {},
  'suse' => {},
  'windows' => {},
  'default_attributes_rhel' => {
    'priority' => '10',
    'action' => 'add',
    'gpgcheck' => true,
    'enabled' => true,
    'failovermethod' => 'priority',
    'fastestmirror_enabled' => false,
    'retries' => 2,
    'retry_delay' => 5,
    'metadata_expire' => '300',
    'mirror_expire' => '300',
    'sslverify' => true,
    'timeout' => '10'
  },
  'default_attributes_debian' => {
    'action' => 'add'
  }
}
