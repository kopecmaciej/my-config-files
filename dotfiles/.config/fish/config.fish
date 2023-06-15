if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim

set WORK_EDITOR nvim
set WORK_DIR /home/cieju/work

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

alias k=kubectl
alias d=docker
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias k_default="k config use-context default"
alias k_lerta_prod="k config use-context gke_sodium-bliss-130615_europe-west1-d_cloudthing-beta"
alias k_lerta_dev="k config use-context gke_sodium-bliss-130615_europe-west1-d_cloudthing-development"
alias lg="lazygit"
alias cfish="cd ~/.config/fish; $WORK_EDITOR"
alias cnvim="cd ~/.config/nvim; $WORK_EDITOR"
alias reload="source ~/.config/fish/config.fish"
alias aws-my="docker run -it -v ~/.docker/custom/aws:/config/.aws/ -v $PWD:/shared -v /var/run/docker.sock:/var/run/docker.sock:rw aws-cli:latest"
alias notibox_start="docker-compose -f ~/work/notibox/notibox-configurator/docker-compose.yml up -d"
alias notibox_stop="docker-compose -f ~/work/notibox/notibox-configurator/docker-compose.yml down"
alias glog="git log --oneline --graph"
alias restart_swww="rm -rf .cache/swww/ && swww init & swww img ~/Pictures/Wallpapers/current_wallpaper"

## function v: if no args than open $WORK_EDITOR, if args than first cd and then open $WORK_EDITOR with args
function v
    if test -z $argv
        $WORK_EDITOR
    else
        cd $argv[1]
        $WORK_EDITOR $argv[2..-1]
    end
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

bind \cg 'lazygit'
bind \cf '_fzf_search_directory'

set fzf_directory_opts --bind "ctrl-o:execute(cd {}; $WORK_EDITOR &> /dev/tty)+abort" 

alias gss='git status --oneline'

starship init fish | source
