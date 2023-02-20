if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim

set WORK_DIR /home/cieju/work

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

alias v="nvim"
alias vh="nvim ."

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
alias cfish="cd ~/.config/fish; nvim ."
alias cnvim="cd ~/.config/nvim; nvim ."
alias reload="source ~/.config/fish/config.fish"
alias aws-my="docker run -it -v ~/.docker/custom/aws:/config/.aws/ -v $PWD:/shared -v /var/run/docker.sock:/var/run/docker.sock:rw aws-cli:latest"

function fw
    cd $WORK_DIR; _fzf_search_directory
end

function fwl
    cd $WORK_DIR/lerta; _fzf_search_directory
end

function fh 
    cd $(find $HOME -maxdepth 4 -type d  | fzf)  
end

function ff 
    cd $(find * -type d | fzf)  
end

set fzf_directory_opts --bind "enter:execute(cd {}; $EDITOR {} &> /dev/tty)" --bind "ctrl-o:execute(cd `{}`)+abort"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.fish.inc' ]; . '/usr/local/google-cloud-sdk/path.fish.inc'; end

# The next line enables shell command completion for gcloud.
bass source '/usr/local/google-cloud-sdk/completion.bash.inc'
alias gss='git status'
