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

node['services'][node.platform_family].each {|_service,options|

  service _service do
    init_command    options['init_command'] if options['init_command']
    pattern         options['pattern'] if options['pattern']
    provider        options['provider'] if options['provider']
    reload_command  options['reload_command'] if options['reload_command']
    restart_command options['restart_command'] if options['restart_command']
    start_command   options['start_command'] if options['start_command']
    status_command  options['status_command'] if options['status_command']
    stop_command    options['stop_command'] if options['stop_command']
    supports        options['supports'] || :status => true, :start => true, :stop => true, :restart => true

    if options['action']
      action options['action']
    else
      # Default to Enable and Start the Service
      action [:start, :enable]
    end

    # Service Init.d or Startup Script
    service_init_d = options['init_command'] || "/etc/init.d/#{_service}"

    only_if { File.exists?(service_init_d) }

  end
}
