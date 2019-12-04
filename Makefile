.PHONY: mosh brew ssh nvim git lint node python eressea java tmux clean-all

nvim_config := $$HOME/.config/nvim
nvim_link := $(nvim_config)/init.vim
nvim_home := $$HOME/.local/share/nvim
git_config := $$HOME/.gitconfig
git_ignore := $$HOME/.gitignore
tpm_home := $$HOME/.tmux/plugins
eslintrc := $$HOME/.eslintrc
pep8 := $$HOME/.pep8


clean-all:
	rm -rf .make.*

mosh: .make.mosh
brew: .make.brew
shell: .make.shell
nvim: .make.nvim
lint: .make.lint
git: .make.git
node: .make.node
python: .make.python
java: .make.java
tmux: .make.tmux

ssh:
	test -L $$HOME/.ssh/config || ln -s $$(pwd)/ssh/config $$HOME/.ssh/config

eressea:
	test -L $$HOME/.zlocal || ln -s $$(pwd)/zsh/zlocal_eressea $$HOME/.zlocal

.make.brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	touch .make.brew

.make.mosh: brew
	brew install mosh
	touch .make.mosh

.make.shell:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $$(pwd)/zprezto
	ln -s $$(pwd)/zprezto $$HOME/.zprezto
	for rcfile in $$(ls zsh); do ln -s "$$(pwd)/zsh/$$rcfile" "$$HOME/.$${rcfile}"; done
	chsh -s /bin/zsh
	touch .make.shell

.make.nvim: git node python
	# brew install neovim
	# npm install -g neovim
	# pip3 install --user pynvim
	mkdir -p $(nvim_config)
	mkdir -p $(nvim_home)/site
	test -L $(nvim_link) || ln -s $$(pwd)/vim/init_bootstrap.vimrc $(nvim_link)
	curl -fLo $(nvim_home)/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall +qa
	rm -rf $(nvim_link)
	ln -s $$(pwd)/vim/init.vimrc $(nvim_link)
	touch .make.nvim

.make.lint:
	test -L $(eslintrc) || ln -s $$(pwd)/lint/eslintrc $(eslintrc)
	test -L $(pep8) || ln -s $$(pwd)/lint/eslintrc $(pep8)
	touch .make.lint

.make.git:
	test -L $(git_config) || ln -s $$(pwd)/git/gitconfig $(git_config)
	test -L $(git_ignore) || ln -s $$(pwd)/git/gitignore $(git_ignore)
	touch .make.git

.make.node:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
	[ -s "$$NVM_DIR/nvm.sh" ] && \. "$$NVM_DIR/nvm.sh" && nvm install node
	touch .make.node

.make.python: brew
	brew install python@3
	touch .make.python

.make.java: brew
	brew tap AdoptOpenJDK/openjdk
	brew cask install adoptopenjdk8
	touch .make.java

.make.tmux: brew
	brew install tmux
	mkdir -p $(tpm_home)
	git clone https://github.com/tmux-plugins/tpm $(tpm_home)/tpm
	ln -s $$(pwd)/tmux/tmux.conf $$HOME/.tmux.conf
	touch .make.tmux
