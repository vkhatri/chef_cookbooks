name             'services'
maintainer       'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license          'Apache 2.0'
description      'Manage Chef Service Resources via Chef Roles node attribute'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(arch debian fedora gentoo mac_os_x openbsd rhel slackware suse windows).each do |os|
    supports os
end
