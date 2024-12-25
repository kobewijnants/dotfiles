function zsh_add_plugin() {
    PLUGIN_NAME=${1##*/}
    [[ -d $ZDOTDIR/plugins ]] || mkdir "$ZDOTDIR/plugins"
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

