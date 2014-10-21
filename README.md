# Chef Cookbook - LeLivreScolaire

Set of cookbooks that help to deploy with Chef.

## Cookbooks

* [ACL](./acl/doc/index.md): Provides some recipes to manage ACLs on deployment
    * [acl::install](./acl/doc/install.md)
    * [acl::setup](./acl/doc/setup.md)
    * [acl::deploy](./acl/doc/deploy.md)
* [Composer](./composer/doc/index.md) Provides some recipes to manage composer dependencies
    * [composer::setup](./composer/doc/setup.md)
    * [composer::install](./composer/doc/install.md)
* [Opswork](./opswork/doc/index.md): Provides helpers for AWS opswork
    * [opswork::acl_deploy](./opswork/doc/acl_deploy.md) *extends* [acl::deploy](./acl/doc/deploy.md)
    * [opswork::composer_install](./opswork/doc/composer_install.md) *extends* [composer::install](./composer/doc/install.md)
    * [opswork::composer_setup](./opswork/doc/composer_setup.md) *extends* [composer::setup](./composer/doc/setup.md)
    * [opswork::symfony_parameters](./opswork/doc/symfony_parameters.md) *extends* [symfony::parameters](./symfony/doc/parameters.md)
* [Symfony](./symfony/doc/index.md): Provides helpers for Symfony applications
    * [symfony::parameters](./symfony/doc/parameters.md)
