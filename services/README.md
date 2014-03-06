services Cookbook
=================

`services` cookbook creates service resources using attribute `node['services'][node.platform]` in Chef Roles or cookbook.

This cookbook allows to manage service resources from Chef Roles similar to defining service resources in cookbook/recipe.

Chef Roles are easy to manage & modify and easily can be scripted as they can be stored in json format.

Requirements
------------
Chef 11.x

Attributes
----------
List of service resources to create is categorized by `node['platform_family']`.

To setup services, simply add services to below attribute:

`node['services'][node.platform_family]`

e.g.

To setup services for rhel platform family nodes, add services list to respective Chef Role like:

`node['services']['rhel']` = `{'service': {options}, 'service': {}}`


```json
  "default_attributes": {
    "services": {
      "rhel": {
        "tomcat7": {},
        "ntpd": {},
        "dhcps": {},
        "named": {},
        "iptables": {},
        "nginx": {},
      }
    }
  }
```

Similarly for debian platform family nodes:

```json
  "default_attributes": {
    "services": {
      "debian": {
        "apach2": {},
        "cron": {},
        "ntp": {},
        "iptables": {}
      }
    }
  }
```


This will simply create a service resource for each listed service with default options.

You can also define options to a service like:

```json
  "default_attributes": {
    "services": {
      "nginx": {
        "start_command": "/etc/init.d/nginx start && sleep 5"
      }
      "apache2": {
        "action": "stop"
      }
    }
  }
```

This will start nginx with defined startup command and stops apache2 service.

Usage
-----

#### services::default

To use this cookbook, just include `services` in your node's `run_list` or respective role environment `env_run_lists`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[services]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: Apache v2.0

Authors: Virender Khatri

**Open Source!**

