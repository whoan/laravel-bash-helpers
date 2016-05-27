Laravel helpers for Bash
========================

It curently provides the following commands:

- artisan  
    Access it from anywhere within your project.

- gulp  
    Access it from anywhere within your project and you won't need it installed globally anymore.

- phpunit  
    Access it from anywhere within your project.

- homestead  
    Access `homestead` globally.


## Installation

You may source the file in your `.bashrc` (or in your current terminal to give it a try):

```bash
git clone https://github.com/whoan/laravel-bash-helpers.git
pathlbs=$PWD/laravel-bash-helpers/laravel-bash-helpers.sh
echo "[ -f \"$pathlbs\" ] && source \"$pathlbs\"" >> ~/.bashrc  # install it in your .bashrc
source "$pathlbs"  # make it available to the current terminal
```

## Usage

### artisan

* previously

    ```bash
    $ php root_of_your_project/artisan ...
    ```

* now

    ```bash
    # from anywhere within your project
    $ artisan ...
    ```

### gulp

* previously

    ```bash
    $ npm install --global gulp # just once, but this won't be necessary anymore
    $ gulp ...
    ```

* now

    ```bash
    # from anywhere within your project
    $ gulp ...
    ```

### phpunit

* previously

  ```bash
  $ cd root_of_your_project
  $ vendor/bin/phpunit ...
  ```

* now

  ```bash
  # from anywhere within your project
  $ phpunit ...
  ```

### homestead

* previously

    ```bash
    $ cd ~/Homestead
    $ vagrant  ...
    ```

* now

    ```bash
    # from anywhere
    $ homestead  ...
    ```

## Contact

[Mail][mail]  
[Twitter][twitter]

## License

**laravel-bash-helpers** is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).

[mail]: mailto:abadiejuan@hotmail.com
[twitter]: https://twitter.com/_whoan_
