# helper
explode() {
    local string=${1:?You must provide the string to explode}
    local delimiter=${2:?You must provide the delimiter}
    local -n out_array=${3:?You must provide an array to store the result}
    unset out_array[*]
    while [[ "$string" =~ $delimiter ]]; do
        out_array+=( "${string%%$delimiter*}" )
        string="${string#*$delimiter}"
    done
    out_array+=( "$string" )
}

# helper
findthis() {
    directories=()
    local path
    explode "$PWD" "/" directories
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

# call artisan from anywhere
artisan() {
    local path
    if path=$(findthis artisan); then
        php "$path" "$@"
    else
        echo "You must be in a Laravel project in order to use artisan" >&2
    fi
}

# no need gulp globally anymore
gulp() {
    local path
    if path=$(findthis node_modules); then
        "$path/gulp/bin/gulp.js" "$@"
    else
        echo "You must install gulp locally in order to use it (npm install gulp)" >&2
    fi
}
