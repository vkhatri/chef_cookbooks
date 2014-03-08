#
# Cookbook Name:: services
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
# "services": {
#   "rhel": {
#     "crond": {},
#     "nginx": {
#       "action": "stop",
#     }
#   },
#   "debian": {
#     "cron": {}
#   }
# }
#

node['services'][node['platform_family']].each {|_service,_options|

  service _service do
    init_command    _options['init_command'] if _options['init_command']
    pattern         _options['pattern'] if _options['pattern']
    provider        _options['provider'].split('::').inject(Object) {|x,y| x.const_get y} if _options['provider']
    reload_command  _options['reload_command'] if _options['reload_command']
    restart_command _options['restart_command'] if _options['restart_command']
    start_command   _options['start_command'] if _options['start_command']
    status_command  _options['status_command'] if _options['status_command']
    stop_command    _options['stop_command'] if _options['stop_command']
    supports        _options['supports'] || :status => true, :start => true, :stop => true, :restart => true

    if _options['action']
      action _options['action']
    else
      # Default to Enable and Start the Service
      action [:start, :enable]
    end

    # Service Init.d or Startup Script
    service_init_d = _options['init_command'] || "/etc/init.d/#{_service}"

    only_if { File.exists?(service_init_d) }

  end
}
