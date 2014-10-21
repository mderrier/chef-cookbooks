# Composer::Setup Recipe

This recipe download and install composer following your configuration.

## Configuration

```json
{
    "composer": {
        "setup": [
            {
                "exec": {
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

`node[:composer][:setup]`: Array of hashes representing composer installations.

#### Execution context

`node[:composer][:setup][0][:exec][:path]`: Array of path to use as CWD when run commands. (Required)

`node[:composer][:setup][0][:exec][:user]`: User which run commands. (Optional, default `root`)

#### Installation

`node[:composer][:setup][0][:path]`: Relative directory where install composer. (Optional)

*missing directories will be created automatically*

`node[:composer][:setup][0][:name]`: Name of the composer executable. (Optional)

`node[:composer][:setup][0][:version]`: Version of composer to install. (Optional)