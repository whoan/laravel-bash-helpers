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

artisan() {
    directories=()
    local path
    explode "$PWD" "/" directories
    while [ ${#directories[@]} -gt 0 ]; do
        path="$( IFS=/ && printf '%s' "${directories[*]}" )/artisan"
        [ -e "$path" ] && break
        unset directories[-1]
    done
    if [ ${#directories[@]} -gt 0 ]; then
        php "$path" "$@"
    else
        echo "You must be in a Laravel project in order to use artisan" >&2
    fi
}
