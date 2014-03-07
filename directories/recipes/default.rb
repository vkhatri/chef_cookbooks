#
# Cookbook Name:: directories
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
# Default service action is :start, :enable
#
# e.g.
# "directories": {
#   "rhel": {
#     "/mnt": {},
#     "/data": {
#       "action": "delete",
#     }
#   },
#   "debian": {
#     "/etc/cron.d": {}
#   }
#   "common": {
#     "/data": {
#       "action": "create"
#     }
#   }
# }
#
# Note: node ['directories'][node.platform_family] directory options overrides node['directories']['common'] directory list options 
#

# Merge Common Directories List with Platform Directories List
directories_list = node['directories']['common'].merge(node['directories'][node.platform_family])

directories_list.each {|_directory,options|
  directory _directory do
    owner           options['owner'] if options['owner']  
    group           options['group'] if options['group']
    mode            options['mode'] || node['directories']['default_attributes']['mode']
    path            options['path'] if options['path']
    provider        options['provider'] if options['provider']
    recursive       options['recursive'] if options['recursive'] || node['directories']['default_attributes']['recursive']
    action          options['action'] if options['action']
  end
}
