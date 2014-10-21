# ACL::Deploy Recipe

This recipe gives ACL permissions following your configuration.

## Configuration

```json
{
    "acl": {
        "deploy": [
            {
                "exec": {
                    "path": ["/srv/www/"],
                    "user": "root"
                },
                "path": ["test/acl", "test/acl2"],
                "options": "R",
                "user": [
                    {
                        "name": ["ubuntu"],
                        "permissions": "rwX"
                    }
                ],
                "group": [
                    {
                        "name": ["www-data"],
                        "permissions": "rwX"
                    }
                ]
            }
        ]
    }
}
```

### Parameters

`node[:acl][:deploy]`: Array of hashes representing directories for ACLs management.

#### Execution context

`node[:acl][:deploy][0][:exec][:path]`: Array of path to use as CWD when run commands. (Required)

`node[:acl][:deploy][0][:exec][:user]`: User which run commands. (Optional, default `root`)

#### Permissions

`node[:acl][:deploy][0][:path]`: Array of relative directories on which give permissions. (required)

*Missing directories will be created automatically*

`node[:acl][:deploy][0][:options]`: Setfacl options to use. (Optional)

`node[:acl][:deploy][0][:user]`: Array of hashes containing users permissions. (Optional)

`node[:acl][:deploy][0][:user][0][:name]`: Array of usernames to which give current permissions. (Required)

`node[:acl][:deploy][0][:user][0][:permissions]`: Permissions to apply to user. (Required)

`node[:acl][:deploy][0][:group]`: Array of hashes containing groups permissions. (Optional)

`node[:acl][:deploy][0][:group][0][:name]`: Array of groupnames to which give current permissions. (Required)

`node[:acl][:deploy][0][:group][0][:permissions]`: Permissions to apply to group(s). (Required)