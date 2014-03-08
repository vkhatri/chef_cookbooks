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

node['packages'][node['platform_family']].each {|_package, _options|
  package _package do
    arch            _options['arch'] if _options['arch']
    allow_downgrade _options['allow_downgrade'] if _options['allow_downgrade']
    source          _options['source'] if _options['source']
    version         _options['version'] if _options['version']
    provider        _options['provider'].split('::').inject(Object) {|x,y| x.const_get y} if _options['provider']
    options         _options['options'] if _options['options']
    flush_cache     _options['flush_cache'] if _options['flush_cache']
    action          _options['action'] || 'install'
  end
} 
