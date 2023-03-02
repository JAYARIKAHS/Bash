function upback()
{
    local direction="$1"
    local levels="$2"
    local path="$PWD"
    
    for ((i=1; i<=levels; i++)); do
        path="$path/.."
    done
    
    cd "$path" && export MPWD="$PWD" || return 1
    
    if [[ "$direction" == "back" && -n "$MPWD" ]]; then
        cd - >/dev/null || return 1
        export MPWD="$path"
    fi
}
