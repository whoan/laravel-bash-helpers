
__explode() {
    local string=${1:?You must provide the string to explode}
    local delimiter=${2:?You must provide the delimiter}
    out_array=${3:?You must provide an array to store the result}
    unset $out_array[*]
    local i=0
    while [[ "$string" =~ $delimiter ]]; do
        read ${out_array}[$((i++))] <<< "${string%%$delimiter*}"
        string="${string#*$delimiter}"
    done
    [ "$string" ] && read ${out_array}[$i] <<< "$string"
}

__find_file() {
    directories=()
    local path
    __explode "$PWD" "/" directories
    while [ ${#directories[@]} -gt 0 ]; do
        path="$( IFS=/ && printf '%s' "${directories[*]}" )/$*"
        if [ -e "$path" ]; then
            echo "$path"
            return
        fi
        unset directories[-1]
    done
    return 1
}

__filter_by_regex() {
    : ${1:?You must provide a pattern}
    local pattern=$1
    shift
    for word in "$@"; do
        [[ "$word" =~ $pattern ]] && echo "$word"
    done
}

artisan() {
    local path
    if path=$(__find_file artisan); then
        php "$path" "$@"
    else
        echo "You must be in a Laravel/Lumen project in order to use artisan" >&2
    fi
}

gulp() {
    local path
    if path=$(__find_file node_modules); then
        "$path/gulp/bin/gulp.js" "$@"
    else
        echo "You must install gulp locally in order to use it (npm install gulp)" >&2
    fi
}

phpunit() {
    local path
    if path=$(__find_file vendor); then
        ( cd "$path/.."  && vendor/bin/phpunit "$@")
    else
        echo "You must be in a project with phpunit in order to execute it" >&2
    fi
}

phpspec() {
    local path
    if path=$(__find_file vendor); then
        ( cd "$path/.."  && vendor/bin/phpspec "$@")
    else
        echo "You must be in a project with phpspec in order to execute it" >&2
    fi
}

homestead() {
    ( cd ~/Homestead && vagrant "$@" )
}

tinker() {
    artisan tinker "$@"
}

serve() {
    artisan serve "$@"
}

loot() {
    local path
    if path=$(__find_file artisan); then
        cd ${path%/*}
    else
        echo "You must be in a Laravel/Lumen project in order to use this command" >&2
    fi
}

linit() {
    local path
    if path=$(__find_file artisan); then
        sudo chmod -R ugo+w storage
        test -d bootstrap/cache && sudo chmod -R ugo+w bootstrap/cache
        if [ ! -f .env ]; then
            if ! cp .env.example .env 2> /dev/null; then
                echo "You should create your environment file (.env)" >&2
            else
                artisan key:generate 2> /dev/null >&2 || echo "NOTICE: You must set the key by hand in your .env" >&2
            fi
        fi
    else
        echo "You must be in a Laravel/Lumen project in order to use this command" >&2
    fi
}

mmigrations() {
    : ${1:?You must provide the table(s) name(s)}
    options=( $(__filter_by_regex ^- "$@") )
    entities=( $(__filter_by_regex ^[^-] "$@") )
    for table in "${entities[@]}"; do
        if [[ "${options[*]}" =~ "table=" ]]; then
            artisan make:migration "${options[@]}" "alter_${table#alter_}"
        else
            artisan make:migration "${options[@]}" --create="$table" "create_${table}"
        fi
        sleep 1 # the migration names use the datetime
    done
}

mseeders() {
    : ${1:?You must provide the seeder(s) name(s)}
    options=( $(__filter_by_regex ^- "$@") )
    entities=( $(__filter_by_regex ^[^-] "$@") )
    for seeder in "${entities[@]}"; do
        artisan make:seeder "${options[@]}" "${seeder%Seeder}"Seeder
    done
}

mmodels() {
    : ${1:?You must provide the model(s) name(s)}
    options=( $(__filter_by_regex ^- "$@") )
    entities=( $(__filter_by_regex ^[^-] "$@") )
    for model in "${entities[@]}"; do
        artisan make:model "${options[@]}" "$model"
    done
}

mcontrollers() {
    : ${1:?You must provide the controller(s) name(s)}
    options=( $(__filter_by_regex ^- "$@") )
    entities=( $(__filter_by_regex ^[^-] "$@") )
    for controller in "${entities[@]}"; do
        artisan make:controller "${options[@]}" "${controller%Controller}"Controller
    done
}

createdb() {
    which mysql > /dev/null || return
    loot
    DB_DATABASE=$(sed -nr 's/DB_DATABASE=([^ \t]+)/\1/p' .env)
    DB_USERNAME=$(sed -nr 's/DB_USERNAME=([^ \t]+)/\1/p' .env)
    DB_PASSWORD=$(sed -nr 's/DB_PASSWORD=([^ \t]+)/\1/p' .env)
    : ${DB_DATABASE:?You should set DB_DATABASE in .env}
    : ${DB_USERNAME:?You should set DB_USERNAME in .env}
    : ${DB_PASSWORD:?You should set DB_PASSWORD in .env}

    echo "Mysql root:" >&2
    mysql -u root -p <<EOF
        CREATE DATABASE IF NOT EXISTS \`$DB_DATABASE\` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci;
        CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD';
        GRANT ALL PRIVILEGES ON \`$DB_DATABASE\`.* TO '$DB_USERNAME'@'%';
        FLUSH PRIVILEGES;
EOF
}

alias ..="cd .."
alias ...="cd ../.."
alias h='cd ~'
alias c='clear'
alias art=artisan
