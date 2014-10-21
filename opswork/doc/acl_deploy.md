# Opswork::Acl_Deploy Recipe

This recipe extends [acl::deploy](../../acl/doc/deploy.md) recipe and provides
a "per application" ACL management.

## Configuration

```json
{
    "acl": {
        "deploy": [
            {
                "exec": {
                    "app": ["my-app-1", "my-app-2"],
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

This recipe's parameters comes in addition to original [acl::deploy](../../acl/doc/deploy.md) recipe's parameters.

#### Execution context

`node[:acl][:deploy][0][:exec][:app]`: Array of applications names on which apply the current rule.

*When you define some `app`, their deploy path will be dynamicaly added to the `path` parameter,
taking advantage of opswork's native Apps configuration*