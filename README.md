# dotvim

## Things to do after a fresh install

1. Turn of fsck-related git options since a lot of the vim plugin repos have fsck errors in them.
1. Go to the root dir of this repo and run `git submodule init && git submodule update`.
2. Go to the YouCompleteMe dir and run `git submodule update --init --recursive` ([it works](https://github.com/Valloric/YouCompleteMe/issues/2724#issuecomment-320524728)).
3. Install ripgrep from brew.
4. Compile [ctrlp-cmatcher](https://github.com/JazzCore/ctrlp-cmatcher) C extension.
5. Compile YouCompleteMe with the `--js-completer` flag.
6. Install [Fira Code](https://github.com/tonsky/FiraCode) font.
7. Turn back on fsck-related git options.
