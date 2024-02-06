if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim

set WORK_EDITOR nvim
set WORK_DIR /home/cieju/work

set -gx PATH $HOME/.cargo/bin $PATH

set NVIM_CONFIG_DIR $HOME/.config/nvim

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

alias k=kubectl
alias d=docker
alias copy=wl-copy
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias k_default="k config use-context default"
alias k_lerta_prod="k config use-context gke_sodium-bliss-130615_europe-west1-d_cloudthing-beta"
alias k_lerta_dev="k config use-context gke_sodium-bliss-130615_europe-west1-d_cloudthing-development"
alias lg="lazygit"
alias cfish="cd ~/.config/fish; $WORK_EDITOR"
alias cnvim="cd ~/.config/nvim; $WORK_EDITOR"
alias reload="source ~/.config/fish/config.fish"
alias penguin-aws="docker run --name penguin-aws --rm -it -v /usr/bin/aws:/usr/bin/aws -v /usr/bin/docker:/usr/bin/docker -v ~/.docker/custom/aws:/config/.aws/ -v /var/run/docker.sock:/var/run/docker.sock:rw ubuntu:latest bash"
alias notibox_start="docker-compose -f ~/work/notibox/notibox-configurator/docker-compose.yml up -d"
alias notibox_stop="docker-compose -f ~/work/notibox/notibox-configurator/docker-compose.yml down"
alias glog="git log --oneline --graph"
alias restart_swww="rm -rf $HOME/.cache/swww/ && swww init & swww img ~/Pictures/Wallpapers/current_wallpaper"
alias obsidian_sync="rsync -a $HOME/projects/pengiun-blog/data/ '$HOME/Documents/Obsidian Vault/Decoded penguin/'; rsync -a $HOME/projects/pengiun-blog/public/images/blog '$HOME/Documents/Obsidian Vault/images'"
alias howto="python3 $HOME/.local/bin/howto.py"
alias tellme="python3 $HOME/.local/bin/tellme.py"
alias gss='git status --short'
alias bambu='/home/cieju/projects/BambuStudio/DockerRun.sh'
alias git_ignore_refresh='git rm -r --cached .'

## function v: if no args than open $WORK_EDITOR, if args than first cd and then open $WORK_EDITOR with args
function v
    if test -z $argv
        $WORK_EDITOR
    else
        cd $argv[1]
        $WORK_EDITOR $argv[2..-1]
    end
end

function unset
  set --erase $argv
end

function fzfh
    cd $(find $HOME -maxdepth 4 -type d  | fzf)  
end

function fzfc
    cd ~/.config; _fzf_search_directory
end

function ff 
    cd $(find * -type d | fzf)  
end

if status is-interactive
and not set -q TMUX
    exec tmux
end

bind \cg 'lazygit'
bind \cf '_fzf_search_directory'

set fzf_directory_opts --bind "ctrl-o:execute(cd {}; $WORK_EDITOR &> /dev/tty)+abort" 

starship init fish | source
