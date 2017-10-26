Laravel/Lumen helpers for Bash
==============================

Useful commands for your Laravel/Lumen development.

## Commands

`artisan`: call the command wherever you are. It's like doing: `php $project_root/artisan`

`linit`: set directory permissions and create your *.env* file if necessary. Useful when you start a new project

`loot`: go to the root of your laravel project (where your *.env* stays)

`phpunit`: call the command wherever you are. It's like doing: `cd $project_root && vendor/bin/phpunit`

`phpspec`: call the command wherever you are. It's like doing: `cd $project_root && vendor/bin/phpspec`

`tinker`: call the command wherever you are. It's like doing: `php $project_root/artisan tinker`

`serve`: call the command wherever you are. It's like doing: `php $project_root/artisan serve`

`gulp`: call the command wherever you are, and you don't need it installed globally anymore

`homestead`: call the command wherever you are. It's like doing: `cd ~/Homestead && vagrant`

### Mysql commands

These command read the information from the *.env* file, so you won't have to type your username/password each time you use them.

You need to set the following variables beforehand:

- `DB_HOST` (optional)
- `DB_DATABASE`
- `DB_USERNAME`
- `DB_PASSWORD`

`createdb`: create the database `$DB_DATABASE`, automatically.

`godb`: open a mysql console ready to execute commands

`query`: execute a query from your shell. eg: `query "show tables"`

### Make multiple migrations, seeders, models and controllers at once

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

These were extracted from [laravel/homestead][laravel-homestead]:

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
