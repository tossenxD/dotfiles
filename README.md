# Declarative Manager for System, User, and Hardware Configurations

This repository can store and apply configuration declarations for multiple
users and systems, currently limited to distributions Arch Linux and NixOS. The
configuration declaration both entails system-level capabilities, such as
drivers and programs to install and settings to enable, and user-level
capabilities, such as user-configurations of programs. All configurations are
defined on a *hostname* basis, which allows fine-grained control of declarations
across different hardware, operating systems, and users.

The repository consists of the following parts, each in its own self-contained
directory:

**arch/** A declarative Arch Linux package manager with its own configuration
language that offers packages from both the official Arch Linux repositories
(including multilib) and the Arch User Repository, while also allowing command
execution after the installation process to e.g. enable a package. In this
instance, declarative neither means version controlling nor declarative
maintenance of packages (use Nix for such features), but rather an
initialization of the system with a reproducible superset of packages.

**nixos/** A NixOS flake defining Nix configurations on a host basis (see NixOS
for more details).

**common/** A common set of package configuration files (often referred to as
dotfiles) and a linker for said files. The linker will never result in data loss
and can safely be used to unlink files as well.

The parts have been coupled using the script **main.sh**. Running the script
can do multiple things, best explained by its own *--help* message. In short, it
can invoke each of the respective parts and can clone the repository over
Git. This allows the script to be called remotely and bootstrap itself just
after the initial OS install, by e.g. using:

>curl -sL https://raw.githubusercontent.com/tossenxD/dotfiles/master/main.sh\
>     | bash -s -- [OPTION]... [HOST]