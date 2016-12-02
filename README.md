Laravel/Lumen helpers for Bash
==============================

Useful commands for your Laravel/Lumen development.

## Commands

```bash
artisan # replaces: php $project_root/artisan
gulp    # you won't need it installed globally anymore
loot    # replaces: cd $project_root
phpunit # replaces: cd $project_root && vendor/bin/phpunit
phpspec # replaces: cd $project_root && vendor/bin/phpspec
tinker  # replaces: php $project_root/artisan tinker
serve   # replaces: php $project_root/artisan serve
linit   # sets directory permissions and creates your *.env* file if necessary
homestead # replaces: cd ~/Homestead && vagrant
```

### `make` multiple migrations, seeders, models and controllers at once

```bash
mmigrations  # usage: mmigrations table1 [table2 [...]]
mseeders     # usage: mseeders Seeder1 [Seeder2 [...]]
mmodels      # usage: mmodels Model1 [Model2 [...]]
mcontrollers # usage: mcontrollers Controller1 [Controller2 [...]]

# You can also use options:
mcontrollers --resource Controller1 [Controller2 [...]]
# And these sentences are the same (suffix appended if not provided):
mcontrollers aController
mcontrollers a
```

### Others

> These were extracted from [laravel/homestead][laravel-homestead]

```bash
..  # cd ..
... # cd ../..
h   # cd ~
c   # clear
art # artisan
```

## Installation

You may source the file in your `.bashrc` (or in your current terminal to give it a try):

```bash
git clone https://github.com/whoan/laravel-bash-helpers.git
_path=$PWD/laravel-bash-helpers/laravel-bash-helpers.sh
echo "test -f \"$_path\"  && source \"$_path\"" >> ~/.bashrc  # install it in your .bashrc
source "$_path"  # make it available to the current terminal
```

## Contact

[Mail][mail]  
[Twitter][twitter]

## License

**laravel-bash-helpers** is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).

[mail]: mailto:juaneabadie@gmail.com
[twitter]: https://twitter.com/_whoan_
[laravel-homestead]: https://github.com/laravel/homestead
