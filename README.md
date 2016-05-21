Laravel helpers for Bash
========================

Day-to-day tasks made easier.

It curently provides the following commands:

- artisan  
    Execute it from anywhere within your project.

- gulp  
    Execute it from anywhere within your project and you won't need it installed globally anymore.

- phpunit  
    Execute it from anywhere within your project.

- homestead  
    Execute it from anywhere.


## Installation

You may source the file in your `.bashrc` (or in your current terminal to give it a try):

```bash
source laravel-bash-helpers.sh
```

## Use

### artisan

* previously

    ```bash
    $ php root_of_your_project/artisan
    ```

* now

    ```bash
    # from anywhere within your project
    $ artisan
    ```

### gulp

* previously

    ```bash
    $ npm install --global gulp # just once, but this won't be necessary anymore
    $ gulp
    ```

* now

    ```bash
    # from anywhere within your project
    $ gulp
    ```

### phpunit

* previously

  ```bash
  $ cd root_of_your_project
  $ vendor/bin/phpunit
  ```

* now

  ```bash
  # from anywhere within your project
  $ phpunit
  ```

### homestead

* previously

    ```bash
    $ cd ~/Homestead
    $ vagrant <command>
    ```

* now

    ```bash
    # from anywhere
    $ homestead <command>
    ```
