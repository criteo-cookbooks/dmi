name             'dmi'
maintainer       'Criteo'
maintainer_email 'sre-core-infra@criteo.com'
license          'Apache-2.0'
description      'Installs/Configures dmi'
long_description 'Installs/Configures dmi'
version          '0.16.0'
supports         'centos'
supports         'debian'
supports         'windows'

chef_version     '>= 12.6' if respond_to?(:chef_version)
issues_url       'https://github.com/criteo-cookbooks/dmi' if respond_to?(:issue_url)
source_url       'https://github.com/criteo-cookbooks/dmi' if respond_to?(:source_url)

depends          'windows'
