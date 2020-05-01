# misdreavus's dotfiles

configuration files for various computers and programs. this repo uses GNU Stow to manage its files.

the folders in this repo either contain config files specific to a program (e.g. `git`, `bash`) or
specific to a computer (e.g. `shiva`, `innis`). folders that introduce specific concepts of their
own may have their own readme.

basic usage: `stow some-folder` to import some configuration, `stow -D some-folder` to remove it.
