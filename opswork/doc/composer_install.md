# Opswork::Composer_Install Recipe

This recipe extends [composer::install](../../composer/doc/install.md) recipe and provides
a "per application" composer installation management.

## Configuration

```json
{
    "composer": {
        "install": [
            {
                "exec": {
                    "user": "root",
                    "app": ["my-app-1", "my-app-2"],
                    "path": ["/srv/www"],
                    "executable": "./composer.phar"
                },
                "prefer": "dist",
                "dev": true,
                "global": false,
                "scripts": true,
                "pluggins": true,
                "optimize_autoloader": false
            }
        ]
    }
}
```

### Parameters

This recipe's parameters comes in addition to original [composer::install](../../composer/doc/install.md) recipe's parameters.

#### Execution context

`node[:composer][:install][0][:exec][:app]`: Array of applications names on which perform a composer install.

*When you define some `app`, their deploy path will be dynamicaly added to the `path` parameter,
taking advantage of opswork's native Apps configuration*