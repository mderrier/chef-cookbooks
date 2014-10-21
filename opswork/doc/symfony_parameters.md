# Opswork::Symfony_Parameters Recipe

This recipe extends [symfony::parameters](../../symfony/doc/parameters.md) recipe and provides
a "per application" Symfony application parameters management.

## Configuration

```json
{
    "symfony": {
        "parameters": [
            {
                "exec": {
                    "app": ["my-app-1", "my-app-2"],
                    "path": ["/srv/www/my-symfony-app"]
                },
                "path": "app/config/parameters.yml",
                "rows": {
                    "my_first_parameter": "my_first_value",
                    "my_second_parameter": "my_second_value"
                }
            }
        ]
    }
}
```
```

### Parameters

This recipe's parameters comes in addition to original [symfony::parameters](../../symfony/doc/parameters.md) recipe's parameters.

#### Execution context

`node[:symfony][:parameters][0][:exec][:app]`: Array of applications names on which install parameters file.

*When you define some `app`, their deploy path will be dynamicaly added to the `path` parameter,
taking advantage of opswork's native Apps configuration*