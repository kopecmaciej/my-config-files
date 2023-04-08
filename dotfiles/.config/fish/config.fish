if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim

set WORK_EDITOR lvim
set WORK_DIR /home/cieju/work

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

alias v=$WORK_EDITOR

alias k=kubectl
alias d=docker
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias vpn-c="gpg -d ~/Documents/Amartus/vpn.connect.sh.gpg | bash"
alias vpn-d="bash ~/Documents/Amartus/vpn.disconnect.sh"
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

function lv 
  cd $argv[1] | $WORK_EDITOR
end

function fzfw
    cd $WORK_DIR; _fzf_search_directory
end

function fzfl
    cd $WORK_DIR/lerta; _fzf_search_directory
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

bind \ef 'v $(echo _fzf_search_directory)'

set fzf_directory_opts --bind "enter:execute(cd {}; $WORK_EDITOR &> /dev/tty)+abort" --bind "ctrl-o:execute(cd {};  &> /dev/tty)+abort"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.fish.inc' ]; . '/usr/local/google-cloud-sdk/path.fish.inc'; end

# The next line enables shell command completion for gcloud.
bass source '/usr/local/google-cloud-sdk/completion.bash.inc'
alias gss='git status --oneline'
