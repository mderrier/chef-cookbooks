# ACL::Setup Recipe

This recipe prepare your filesystems to manage ACLs following your configuration.

## Configuration

### Référence

```json
{
    "acl": {
        "setup": [
            {
                "exec": {
                    "path": "/",
                    "user": "root"
                },
                "path": "/srv/www",
                "type": "ext4"
            }
        ]
    }
}
```

### Parameters

`node[:acl][:setup]`: Array of hashes representing mountpoints for ACLs.

#### Execution context

`node[:acl][:setup][0][:exec][:path]`: CWD to set before run commands. (Optional, default `/`)

`node[:acl][:setup][0][:exec][:user]`: User which run commands. (Optional, default `root`)

#### Mountpoint

`node[:acl][:setup][0][:path]`: Mountpoint on which enable ACLs. (Required)

`node[:acl][:setup][0][:type]`: Filesystem type. (Required)