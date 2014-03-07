directories Cookbook
====================

`directories` cookbook creates directory resources using attribute `node['directories'][node.platform]` in Chef Roles or cookbook.

This cookbook allows to manage `directory` resources from within Chef Roles similar to defining directory resources in cookbook/recipe.

Chef Roles are easy to manage & modify and easily can be scripted as they can be stored in json format.

Requirements
------------
Chef

Attributes
----------

List of `directory` resources to create is categorized by `node['platform_family']` and 'common'.

To setup directories, simply add directory name with options if any to below attributes:

`node['directories'][node.platform_family]` which is dynamic to a node, any options set or unset for a directory here overrides directory options in node['directories']['common']
`node['directories']['common']` which create directory resources regardless of platform_family

e.g.

To setup directories for rhel/debian platform family or common for all nodes, add directories list to respective Chef Role like:

```json
  "default_attributes": {
    "directories": {
      "rhel": {
        "directory_path1": {},
        "directory_path2": {},
        "directory_path3": {}
      },
      "debian": {
        "directory_path": {
          "owner": "user_name",
          "group": "group_name",
          "mode": "0755"
          "other_directory_resource_option": "value"
        }
      },
      "common": {
        "directory_path": {
          "owner": "user_name",
          "group": "group_name",
          "mode": "0755"
          "other_directory_resource_option": "value"
        }
      }
    }
  }

```

This will create directories with defined mode, owner and group.

Usage
-----
#### directories::default

To use this cookbook, just include `directories` in your node's `run_list` or respective role environment `env_run_lists`:

```json
  "run_list": [
    "recipe[directories]"
  ],
  "env_run_lists": {
    "production": [
      "recipe[directories]"
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
