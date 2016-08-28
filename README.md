Laravel helpers for Bash
========================

## Commands

### artisan

Use `artisan` from anywhere within your project.

* before

    ```bash
    $ php root_of_your_project/artisan ...
    ```

* now

    ```bash
    $ artisan
    ```

### gulp

Access it from anywhere within your project and you won't need it installed globally anymore.

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

Access it from anywhere within your project.

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

Access `homestead` globally.

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

Use `tinker` as a standalone command.

* before

    ```bash
    $ artisan tinker
    ```

* now

    ```bash
    $ tinker
    ```

### serve

Use `serve` as a standalone command.

* before

    ```bash
    $ artisan serve
    ```

* now

    ```bash
    $ serve
    ```

### loot

`cd` to the root of the laravel project.

```bash
$ loot
```

## Installation

You may source the file in your `.bashrc` (or in your current terminal to give it a try):

```bash
git clone https://github.com/whoan/laravel-bash-helpers.git
pathlbs=$PWD/laravel-bash-helpers/laravel-bash-helpers.sh
echo "test -f \"$pathlbs\"  && source \"$_\"" >> ~/.bashrc  # install it in your .bashrc
source "$_"  # make it available to the current terminal
```

## Contact

[Mail][mail]  
[Twitter][twitter]

## License

**laravel-bash-helpers** is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).

[mail]: mailto:abadiejuan@hotmail.com
[twitter]: https://twitter.com/_whoan_
