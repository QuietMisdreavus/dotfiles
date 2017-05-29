# misdreavus's dotfiles

Distribution and storage of some of my configuration files, especially for my laptop `cubia`.
Machine-specific configuration (or things I didn't want to bother with merging) are in folders
matching their hostname.

Computers represented:

* `cubia` (MacBook Air, 11-inch, Arch Linux)

Programs represented:

* Termite
* Dunst
* spectrwm (plus some scripts for the bar/laptop things)
* Bash
* Firefox (userChrome.css)

## Using this repo

In theory, this repo is set up so that you can clone it into your home directory and use GNU Stow to
link config files into their proper places. For example:

```sh
cd ~
git clone https://github.com/QuietMisdreavus/dotfiles
cd dotfiles
stow termite
stow dunst
stow $HOSTNAME
#run firefox first to create the default profile folder
#(you'll also need to either download the images for the menu buttons or change the URLs to the ones
#in the comments)
ln -s $(pwd)/firefox/userChrome.css ~/.mozilla/firefox/{profile folder}/chrome/
```
