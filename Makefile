.PHONY: mosh brew ssh nvim git lint node python eressea numenor java tmux libs dotnet node-libs brew-libs clean-all secrets pandoc

arch = $(shell uname)
ifeq ($(arch),Linux)
	install = sudo apt install -y
	update = sudo apt update
	upgrade = sudo apt install -y
	python = python@2
	pip = pip
else
	install = brew install
	update = brew update
	upgrade = brew upgrade
	python = python@3
	pip = pip3
endif

config := $$HOME/.config
nvim_config := $(config)/nvim
nvim_link := $(nvim_config)/init.vim
coc_link := $(nvim_config)/coc-settings.json
nvim_home := $$HOME/.local/share/nvim
pandoc_home := $$HOME/.local/share/pandoc
git_config := $$HOME/.gitconfig
git_ignore := $$HOME/.gitignore
tpm_home := $$HOME/.tmux/plugins
tmuxinator_home := $(config)/tmuxinator
eslintrc := $$HOME/.eslintrc
pep8 := $$HOME/.pep8
nvm := "$$HOME/.nvm"

clean-all:
	rm -rf .make.*

mosh: .make.mosh
brew: .make.brew
shell: .make.shell
nvim: .make.nvim
lint: .make.lint
git: .make.git
pandoc: .make.pandoc
node: .make.node
python: .make.python
java: .make.java
dotnet: .make.dotnet
tmux: .make.tmux
libs: node-libs brew-libs
node-libs: .make.node-libs
brew-libs: .make.brew-libs

ssh:
	test -L $$HOME/.ssh/config || ln -s $$(pwd)/ssh/config $$HOME/.ssh/config

eressea:
	test -L $$HOME/.zlocal || ln -s $$(pwd)/zsh/zlocal_eressea $$HOME/.zlocal

numenor:
	test -L $$HOME/.zlocal || ln -s $$(pwd)/zsh/zlocal_numenor $$HOME/.zlocal

headspin:
	test -L $$HOME/.zlocal || ln -s $$(pwd)/zsh/zlocal_headspin $$HOME/.zlocal

secrets:
	if [[ -d secrets ]]; then \
		cd secrets && git pull origin master && cd ..; \
	else \
		git clone git@git.jlipps.com:jlipps/secrets secrets; \
		test -L $$HOME/.zsecrets || ln -s $$(pwd)/secrets/zsecrets $$HOME/.zsecrets; \
	fi

.make.brew:
	if [[ "$$(uname)" == "Darwin" ]]; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	fi
	touch .make.brew

.make.mosh: .make.brew
	$(install) mosh
	touch .make.mosh

.make.shell:
	if [[ "$$(uname)" == "Linux" ]]; then \
		$(install) zsh; \
	fi
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $$(pwd)/zprezto
	ln -s $$(pwd)/zprezto $$HOME/.zprezto
	for rcfile in $$(ls zsh); do ln -s "$$(pwd)/zsh/$$rcfile" "$$HOME/.$${rcfile}"; done
	chsh -s /bin/zsh
	touch .make.shell

.make.nvim: .make.git .make.node .make.python
	if [[ "$$(uname)" == "Linux" ]]; then \
		sudo add-apt-repository -y ppa:neovim-ppa/stable; \
		$(update); \
	fi
	$(install) neovim || true
	npm install -g neovim
	$(pip) install --user pynvim
	mkdir -p $(nvim_config)
	mkdir -p $(nvim_home)/site
	test -L $(nvim_link) || ln -s $$(pwd)/vim/init_bootstrap.vimrc $(nvim_link)
	test -L $(coc_link) || ln -s $$(pwd)/vim/coc-settings.json $(coc_link)
	curl -fLo $(nvim_home)/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall +qa
	rm -rf $(nvim_link)
	ln -s $$(pwd)/vim/init.vimrc $(nvim_link)
	if [[ "$$(uname)" == "Darwin" ]]; then \
		ln -s $$(pwd)/vim/local_lothlorien.vimrc $$(pwd)/vim/local.vimrc
	fi
	touch .make.nvim

.make.lint:
	test -L $(eslintrc) || ln -s $$(pwd)/lint/eslintrc $(eslintrc)
	test -L $(pep8) || ln -s $$(pwd)/lint/eslintrc $(pep8)
	touch .make.lint

.make.git:
	test -L $(git_config) || ln -s $$(pwd)/git/gitconfig $(git_config)
	test -L $(git_ignore) || ln -s $$(pwd)/git/gitignore $(git_ignore)
	touch .make.git

.make.pandoc:
	test -L $(pandoc_home) || ln -s $$(pwd)/pandoc $(pandoc_home)
	touch .make.pandoc

.make.node: .make.shell
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
	source $(nvm)/nvm.sh && nvm install --lts
	npm install -g yarn  # yarn is necessary for nvim plugin compilation, so install it now
	touch .make.node

.make.python: .make.brew
	$(install) $(python)
	touch .make.python

.make.java: .make.brew
	brew tap AdoptOpenJDK/openjdk
	brew cask install adoptopenjdk11
	touch .make.java

.make.tmux: .make.brew
	$(install) tmux # tmuxinator
	mkdir -p $(config)
	mkdir -p $(tpm_home)
	git clone https://github.com/tmux-plugins/tpm $(tpm_home)/tpm
	test -L $$HOME/.tmux.conf || ln -s $$(pwd)/tmux/tmux.conf $$HOME/.tmux.conf
	# test -L $(tmuxinator_home) || ln -s $$(pwd)/tmuxinator $(tmuxinator_home)

.make.node-libs: .make.node
	npm install -g diff-so-fancy mocha gulp eslint jsonlint markdownlint-cli yarn
	touch .make.node-libs

.make.brew-libs: .make.brew
	$(install) the_silver_searcher reattach-to-user-namespace jq gradle broot
	touch .make.brew-libs

.make.dotnet: .make.brew
	brew cask install dotnet-sdk
