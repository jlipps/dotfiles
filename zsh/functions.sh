function cleannvim {
    find ~/.local/share/nvim/swap -name "*%$1%*.sw[o|p]" -delete
}

function version_and_publish() {
    name=$(cat package.json | grep '"name"' | sed -En 's/^.*"name":.+"([^"]+)".*$/\1/p')
    echo "* Determined package name was $name"
    ver=$1
    remote=$2
    echo "* Running npm version $ver"
    npm version $ver
    new_ver=$(cat package.json | grep '"version"' | sed -En 's/^.*"version":.+"([^"]+)".*$/\1/p')
    echo "* New version is $new_ver"
    echo "* Pushing update and tags"
    git push --tags $remote master
    echo "* Running npm publish"
    npm publish
}

function remux() {
    tmux -2 -L $1 attach-session -t $1
}

function winname() {
    tmux rename-window $1
}

function pane_id_for_window_spec() {
    tmux list-panes -s -F "#I.#P #D" | grep "$1\.$2 %[0-9]" | tail -c -2
}

function mult_replace() {
  for file in `ag -l $1`
    do perl -pi -e "s|$1|$2|g;" $file
  done
}

function pcount() {
    while true
    do
        sleep 1
        n=$(ps aux | grep $1 | wc -l | tr -s " "); 
        declare -i n; 
        n=$n-1; # remove grep from ps
        echo "$n"
    done
}

function alert() {
    msg=${1:-"Something happened"}
    title=${2:-"Alert"}
    sound=${3:-"Ping"}
    display="display notification \"$msg\""
    with_title="with title \"$title\""
    and_sound_name="sound name \"$sound\""
    /usr/bin/osascript -e "$display $with_title $and_sound_name"
}

function newmux() {
    tmux new-session -d -s "$1" -n "$1"
    tmux attach-session -t "$1"
}
