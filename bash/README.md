# misdreavus's bash config

usually my bashrc follows a general pattern, but there are usually some system-specific tweaks that
need to be layered on top. things like tool-specific installed binaries, system-specific quirks that
need to be accounted for, etc. the solution i had to deal with this (and also version-control my
configuration) was similar to what i did with [my vim config][vimfiles]: let systems/tools add their
own scripts, and make the central script load them.

[vimfiles]: https://github.com/QuietMisdreavus/vimfiles

this is executed with the following snippet at the end of `dot-bashrc`:

```bash
# load extra scripts that have been placed by other dotfiles configurations
bash_scripts="$XDG_CONFIG_HOME/misdreavus/bashrc.d"
if [ -d "$bash_scripts" ] ; then
    # source any executable file under the misdreavus scripts folder
    while IFS= read -r -d '' f ; do
        source "$f"
    done < <(find -L "$bash_scripts" -type f -perm -0700 -print0)
fi
```

and other folders in this repo that want to add things to my bash sessions can add scripts to
`~/.config/misdreavus/bashrc.d`, which will then get loaded as part of my main bashrc.

i also took advantage of this to factor out the code that sets my bash prompt into the `set-ps1`
script.
