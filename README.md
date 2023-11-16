**Prerequisite:** Arch Linux with git and base-devel.

**Install:** Run the startup script.
```
$ ./dotfiles/run.sh
```
There are 4 installation types. [run](https://github.com/tossenxD/dotfiles/blob/main/run.sh) will ask you for a type and to confirm the selected type.
| includes | [basic packages, directories & wallpaper](https://github.com/tossenxD/dotfiles/blob/main/.basic.sh) | [extra packages](https://github.com/tossenxD/dotfiles/blob/main/.extras.sh) | [dotfiles](https://github.com/tossenxD/dotfiles/blob/main/.dotfiles.sh) |
| ---------|:----------------------:|:--------------:|:--------:|
| full     | x                      | x              | x        |
| basic    | x                      |                | x        |
| extras   |                        | x              |          |
| dotfiles |                        |                | x        |

Packages can be modified in [.basic.sh](https://github.com/tossenxD/dotfiles/blob/main/.basic.sh) and [.extras.sh](https://github.com/tossenxD/dotfiles/blob/main/.extras.sh).

**Usage:**
Run X (IceWM for stacking, Bspwm for tilling)
```
$ startx
```
or Wayland (Sway)
```
$ sway
```
