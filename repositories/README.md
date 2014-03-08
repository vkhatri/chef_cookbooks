repositories Cookbook
=================

`repositories` cookbook creates yum/apt repository resources using attribute `node['repositories'][node.platform]` using Chef Roles.

This cookbook allows to manage packagerepository resources from within Chef Roles similar to defining packagerepository resources in cookbook/recipe.

Chef Roles are easy to manage & modify and easily can be scripted as they can be stored in json format.

Requirements
------------
Chef

Attributes
----------
List of repository resources to create is categorized by `node['platform_family']`.

To setup repositories, simply add repositories to below attribute:

`node['repositories'][node.platform_family]`

e.g.

To setup yum repositories for rhel platform family nodes, add repository list to respective Chef Role / node like:

`node['repositories']['rhel']` = `{'repository_file': {options}, 'repository_file': {}}`


```json
  "default_attributes": {
    "repositories": {
      "rhel": {
        "epel": {
          "description": "Extra Packages for Enterprise Linux 6 - $basearch",
          "baseurl": "http://download.fedoraproject.org/pub/epel/6/$basearch",
          "mirrorlist": "https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch",
          "gpgkey": "http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6"
        }
      }
    }
  }
```

Similarly for debian platform family nodes:

```json
  "default_attributes": {
    "repositories": {
      "debian": {
        "zenoss": {
          "uri": "http://dev.zenoss.org/deb",
          "action": "remove"
        }
      }
    }
  }
```

This will simply create a repository resource for each listed repository.

Usage
-----

#### repositories::default

To use this cookbook, just include `repositories` in your node's `run_list` or respective role environment `env_run_lists`:

```json
  "run_list": [
    "recipe[repositories]"
  ],
  "env_run_lists": {
    "production": [
      "recipe[repositories]"
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

