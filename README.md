# dotvim

## Things to do after a fresh install

1. Turn of fsck-related git options since a lot of the vim plugin repos have fsck errors in them.
1. Go to the root dir of this repo and run:
  * `git submodule init && git submodule update`
2. Compile YouCompleteMe.
  * `cd bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py`
3. Install brew packages.
  * `brew install ripgrep`
4. Install gems.
  * `gem install neovim fastri rcodetools`
5. Install Python packages.
  * `pip3 install --upgrade --user neovim`
6. Install [Fira Code](https://github.com/tonsky/FiraCode) font.
7. Turn back on fsck-related git options.
