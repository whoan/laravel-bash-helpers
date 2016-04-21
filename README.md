Laravel helpers for Bash
========================

Execute `artisan`, `gulp` and `phpunit` from anywhere within your project and you won't need `gulp` installed globally anymore.

## Installation

You may source the file and use it:

```bash
source laravel-helpers.sh
```

You can also source it in your `~/.bashrc` to install it permanently.

## Use

`artisan`

```bash
# previously
$ php root_of_your_project/artisan
```

```bash
# now
$ artisan # from anywhere within your project
```

`gulp`

```bash
# previously
$ npm install --global gulp # just once, but this won't be necessary anymore
$ gulp # from anywhere within your project
```

```bash
# now
$ gulp
```

`phpunit`

```bash
# previously
$ cd root_of_your_project
$ vendor/bin/phpunit
```

```bash
# now
$ phpunit # from anywhere within your project
```
