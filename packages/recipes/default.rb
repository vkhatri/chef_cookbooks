#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright 2014, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# node attributes 'services' is categorized for attribute 'platform_family'.
# Default service action is :install
#
# e.g.
# "packages": {
#   "rhel": {
#     "cronie": {},
#     "rsyslog": {
#       "action": "remove",
#     }
#   },
#   "debian": {
#     "cron": {}
#   }
# }
#

node['packages'][node.platform_family].each {|_package,package_options|
  package_action = package_options['action'] || 'install'

  package _package do
    arch            package_options['arch'] if package_options['arch']
    allow_downgrade package_options['allow_downgrade'] if package_options['allow_downgrade']
    source          package_options['source'] if package_options['source']
    version         package_options['version'] if package_options['version']
    provider        package_options['provider'] if package_options['provider']
    options         package_options['options'] if package_options['options']
    flush_cache     package_options['flush_cache'] if package_options['flush_cache']
    action          package_action.to_sym
  end
} 
