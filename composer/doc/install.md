# Composer::Install Recipe

This recipe download and install composer following your configuration.

## Configuration

```json
{
    "composer": {
        "install": [
            {
                "exec": {
                    "user": "root",
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

`node[:composer][:install]`: Array of hashes representing composer install commands.

#### Execution context

`node[:composer][:install][0][:exec][:path]`: Array of path to use as CWD when run commands. (Required)

`node[:composer][:install][0][:exec][:user]`: User which run commands. (Optional, default `root`)

`node[:composer][:install][0][:exec][:executable]`: Executable to use for commands. (Optional, default `./composer.phar`)

#### Command context

`node[:composer][:setup][0][:prefer]`: Prefered installation method (Optional, default `dist`).

`node[:composer][:setup][0][:dev]`: Whether or not install dev dependencies. (Optional, default `true`)

`node[:composer][:setup][0][:global]`: Whether or not install globally. (Optional, default `false`)

`node[:composer][:setup][0][:scripts]`: Whether or not use composer scripts. (Optional, default `true`)

`node[:composer][:setup][0][:pluggins]`: Whether or not use composer pluggins. (Optional, default `true`)

`node[:composer][:setup][0][:optimize_autoloader]`: Whether or not optimize composer's autoloader. (Optional, default `false`)