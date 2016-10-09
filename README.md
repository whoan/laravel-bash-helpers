Laravel/Lumen helpers for Bash
==============================

It provides useful commands for your Laravel development.

## Installation

You may source the file in your `.bashrc` (or in your current terminal to give it a try):

```bash
git clone https://github.com/whoan/laravel-bash-helpers.git
pathlbs=$PWD/laravel-bash-helpers/laravel-bash-helpers.sh
echo "test -f \"$pathlbs\"  && source \"$pathlbs\"" >> ~/.bashrc  # install it in your .bashrc
source "$pathlbs"  # make it available to the current terminal
```

## Commands

* **artisan**: Use it from anywhere within your project.
* **gulp**: Use it from anywhere within your project and you won't need it installed globally anymore.
* **phpunit**: Use it from anywhere within your project.
* **homestead**: Access `homestead` globally.
* **tinker**: Use it from anywhere within your project.
* **serve**: Use it from anywhere within your project.
* **loot**: `cd` to the root of the laravel project.
* **linit**: Initialize your project. It sets directory permissions and creates your *.env* file if necessary.
* **mmigrations**: `make` multiple migrations.
* **mseeders**: `make` multiple seeders.
* **mmodels**: `make` multiple models.
* **mcontrollers**: `make` multiple controllers.

## Examples

### artisan

* before

    ```bash
    $ php root_of_your_project/artisan
    ```

* now

    ```bash
    $ artisan
    ```

### gulp

* before

    ```bash
    $ npm install --global gulp # just once, but this won't be necessary anymore
    $ gulp
    ```

* now

    ```bash
    $ gulp
    ```

### phpunit

* before

  ```bash
  $ cd root_of_your_project
  $ vendor/bin/phpunit
  ```

* now

  ```bash
  $ phpunit
  ```

### homestead

* before

    ```bash
    $ cd ~/Homestead
    $ vagrant
    ```

* now

    ```bash
    $ homestead
    ```

### tinker

* before

    ```bash
    $ php artisan tinker
    ```

* now

    ```bash
    $ tinker
    ```

### serve

* before

    ```bash
    $ php artisan serve
    ```

* now

    ```bash
    $ serve
    ```

### loot

```bash
$ loot
```

### linit

```bash
$ linit
```

### mmigrations, mseeders, mmodels, mcontrollers

```bash
mmigrations table1 [table2 [...]]
mseeders Seeder1 [Seeder2 [...]]
mmodels Model1 [Model2 [...]]
mcontrollers Controller1 [Controller2 [...]]
```

## Contact

[Mail][mail]  
[Twitter][twitter]

## License

**laravel-bash-helpers** is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).

[mail]: mailto:abadiejuan@hotmail.com
[twitter]: https://twitter.com/_whoan_
