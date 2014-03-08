#
# Cookbook Name:: repositories
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

default_attributes  = node['repositories']["default_attributes_#{node['platform_family']}"] 

case node['platform_family']
when 'debian'
  node['repositories'][node['platform_family']].each {|repo_name, _options|
    if _options['action'].to_s == 'delete'
      apt_repository repo_name do
        action  "delete"
      end
    else
      _options = default_attributes.merge(_options)
      apt_repository repo_name do
        action repo__options['action']
      end
    end
  }

when 'rhel'
  node['repositories'][node['platform_family']].each {|repo_name, _options|
    if _options['action'].to_s == 'delete'
      yum_repository repo_name do
        action  "delete"
      end
    else
      _options = default_attributes.merge(_options)
      yum_repository repo_name do
        description       _options['description']
        baseurl           _options['baseurl']
        mirrorlist        _options['mirrorlist']
        gpgcheck          _options['gpgcheck'] 
        gpgkey            _options['gpgkey']
        enabled           _options['enabled']
        cost              _options['cost'] if _options['cost']
        exclude           _options['exclude'] if _options['exclude']
        enablegroups      _options['enablegroups'] if _options['enablegroups']
        failovermethod    _options['failovermethod'] 
        http_caching      _options['http_caching'] if _options['http_caching']
        include_config    _options['include_config'] if _options['include_config']
        includepkgs       _options['includepkgs'] if _options['includepkgs']
        keepalive         _options['keepalive'] if _options['keepalive']
        retries           _options['retries'].to_i
        retry_delay       _options['retry_delay'].to_i
        max_retries       _options['max_retries'] if _options['max_retries']
        metadata_expire   _options['metadata_expire'] 
        mirror_expire     _options['mirror_expire'] 
        priority          _options['priority'] if _options['priority']
        proxy             _options['proxy'] if _options['proxy']
        proxy_username    _options['proxy_username'] if _options['proxy_username']
        proxy_password    _options['proxy_password'] if _options['proxy_password']
        repositoryid      _options['repositoryid'] if _options['repositoryid']
        sslcacert         _options['sslcacert'] if _options['sslcacert']
        sslclientcert     _options['sslclientcert'] if _options['sslclientcert']
        sslclientkey      _options['sslclientkey'] if _options['sslclientkey']
        sslverify         _options['sslverify'] 
        timeout           _options['timeout'] 
        action            _options['action']
      end
    end
  }
end
