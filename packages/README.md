packages Cookbook
=================

`packages` cookbook creates package resources using attribute `node['packages'][node.platform]` in Chef Roles.

This cookbook allows to manage package resources from Chef Roles similar to defining package resources in cookbook/recipe.

This gives an advantage of package version control across platforms, environments or roles etc.

Chef Roles are easy to manage & modify and easily can be scripted as they can be stored in json format.

Requirements
------------
Chef 11.x

Attributes
----------
List of package resources to create is categorized by `node['platform_family']`.

To setup packages, simply add packages to below attribute:

`node['packages'][node.platform_family]`

e.g.

To install packages for rhel platform family nodes, add packages list to respective Chef Role like:

`node['packages']['rhel']` = `{'package': {options}, 'package': {}}`


```json
  "default_attributes": {
    "packages": {
      "rhel": {
        "telnet": {},
        "logrotate": {},
        "perl": {},
        "python": {},
        "iptables": {},
        "patch": {},
      }
    }
  }
```

Similarly for debian platform family nodes:

```json
  "default_attributes": {
    "packages": {
      "debian": {
        "telnet": {},
        "perl": {},
        "python": {},
        "iptables": {}
      }
    }
  }
```


This will simply create a package resource for each listed package with default options.

You can also define options to a package like:

```json
  "default_attributes": {
    "packages": {
      "telnet": {
        "version": "xyz"
      }
      "rsyslog": {
        "action": "purge"
      }
    }
  }
```

This will install defined version of telnet package and purge rsyslog package.

Usage
-----

#### packages::default

To use this cookbook, just include `packages` in your node's `run_list` or respective role environment `env_run_lists`:

```json
  "run_list": [
    "recipe[packages]"
  ],
  "env_run_lists": {
    "production": [
      "recipe[packages]"
    ],
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

