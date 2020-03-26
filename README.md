# Dotfiles

## Mac

## Manual steps to basic dev

1. Log in and type `git` to trigger git install
1. `mkdir -p ~/code/jlipps && cd code/jlipps`
1. Add correct SSH key to ~/.ssh/id_rsa*
1. `git clone git@github.com:jlipps/dotfiles.git`
1. `cd dotfiles && make shell`
1. exit and re-log-in with new shell, get back to dir

## Manual software install

1. Xcode
1. Android Studio
1. IntelliJ?
1. Screens Connect (for remote vnc)

## Alpine Linux

1. apk add git bash openssh-client sudo shadow man man-pages make zsh curl
2. Add a 'jlipps' user with home dir
3. Add jlipps to sudoers
4. Add conditional to /etc/profile to `su -l jlipps` on login if user is not already jlipps
5. Add correct SSH key to ~/.ssh/id_rsa*
6. `git clone git@github.com:jlipps/dotfiles.git`
7. `cd dotfiles && make shell`
