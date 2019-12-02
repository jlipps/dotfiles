.PHONY: mosh brew clean-all

clean-all:
	rm -rf .make.*

mosh: .make.mosh
brew: .make.brew
shell: .make.shell

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
