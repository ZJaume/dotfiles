# dotfiles
## Requirements
The instructions assume that `yay` AUR Helper is installed and `fish` shell is used.
Install it first
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S fish
```

## Instructions
Clone the repository
```
git clone https://github.com/ZJaume/dotfiles
cd dotfiles
```

Install the required packages for desktop environment
```
yay -Syu (paste -sd ' ' packages.txt)
```

Copy config files to home directory
```
./bootstrap.sh
```

Now login on tty1 and enjoy!
