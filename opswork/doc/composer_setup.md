# Opswork::Composer_Setup Recipe

This recipe extends [composer::setup](../../composer/doc/setup.md) recipe and provides
a "per application" composer installation management.

## Configuration

```json
{
    "composer": {
        "setup": [
            {
                "exec": {
                    "app": ["my-app-1", "my-app-2"],
                    "path": ["/usr/local"],
                    "user": "root"
                },
                "path": "bin",
                "name": "composer",
                "version": "1.0.0-alpha8"
            }
        ]
    }
}
```

### Parameters

This recipe's parameters comes in addition to original [composer::setup](../../composer/doc/setup.md) recipe's parameters.

#### Execution context

`node[:composer][:setup][0][:exec][:app]`: Array of applications names on which install composer.

*When you define some `app`, their deploy path will be dynamicaly added to the `path` parameter,
taking advantage of opswork's native Apps configuration*