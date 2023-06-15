#! /bin/bash

# add nerd fonts

if [[ "${UID}" -ne 0 ]]
then
    echo 'Must be executed with sudo or root' >&2
    exit 1
fi

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip
unzip DejaVuSansMono.zip -d DejaVuSansMono

mv DejaVuSansMono/* /usr/local/share/fonts/

fc-cache -f -v

rm -rf DejaVuSansMono

