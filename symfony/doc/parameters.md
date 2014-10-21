# Symfony::Parameters Recipe

This recipe provides a parameters file generation for symfony applications.

*Parameters are compiled before files are generated, so that you can explode them in different sets*

## Configuration

```json
{
    "symfony": {
        "parameters": [
            {
                "exec": {
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

### Parameters

`node[:symfony][:parameters]`: Array of hashes representing set of parameters to include in files.

#### Execution context

`node[:symfony][:parameters][0][:exec][:path]`: Array of symfony apps root paths. (Required)

#### Command context

`node[:composer][:setup][0][:path]`: Relative path to parameters file (Optional, default `aa/config/parameters.yml`).

`node[:composer][:setup][0][:rows]`: Hash reprensenting a set of parameters. (Required)