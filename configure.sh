#!/bin/bash

  error="[$(tput setaf 1)  ERROR  $(tput sgr0)]"
success="[$(tput setaf 2) SUCCESS $(tput sgr0)]"
warning="[$(tput setaf 3) WARNING $(tput sgr0)]"


if mkdir ~/Desktop; then
    echo "$success Created: \"Desktop\" folder"
else
    echo "$warning Not created: \"Desktop\" folder"
fi

if mkdir ~/Downloads; then
    echo "$success Created: \"Downloads\" folder"
else
    echo "$warning Not created: \"Downloads\" folder"
fi

if mkdir ~/Templates; then
    echo "$success Created: \"Templates\" folder"
else
    echo "$warning Not created: \"Templates\" folder"
fi

if mkdir ~/Public; then
    echo "$success Created: \"Public\" folder"
else
    echo "$warning Not created: \"Public\" folder"
fi

if mkdir ~/Documents; then
    echo "$success Created: \"Documents\" folder"
else
    echo "$warning Not created: \"Documents\" folder"
fi

if mkdir ~/Documents/Projects; then
    echo "$success Created: \"Projects\" folder"
else
    echo "$warning Not created: \"Projects\" folder"
fi

if mkdir ~/Music; then
    echo "$success Created: \"Music\" folder"
else
    echo "$warning Not created: \"Music\" folder"
fi

if mkdir ~/Pictures; then
    echo "$success Created: \"Pictures\" folder"
else
    echo "$warning Not created: \"Pictures\" folder"
fi

if mkdir ~/Pictures/Screenshots; then
    echo "$success Created: \"Screenshots\" folder"
else
    echo "$warning Not created: \"Screenshots\" folder"
fi

if mkdir ~/Videos; then
    echo "$success Created: \"Videos\" folder"
else
    echo "$warning Not created: \"Videos\" folder"
fi


if sudo cp -r ./sddm/. /etc/; then
    echo "$success Copied: login screen files"
else
    echo "$error Not copied: login screen files"
fi

if cp -r ./home/. ~/; then
    echo "$success Copied: home files"
else
    echo "$error Not copied: home files"
fi

if cp -r ./applications/. ~/.local/share/applications/; then
    echo "$success Copied: .desktop files"
else
    echo "$error Not copied: .desktop files"
fi

if cp -r ./config/. ~/.config/; then
    echo "$success Copied: configuration files"
else
    echo "$error Not copied: configuration files"
fi
