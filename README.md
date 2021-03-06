# BenBergman's zsh Configuration

This repository contains my various customizations for [zsh].

There are two main methods of installing this configuration.

##YOLO install

```bash
$ curl https://raw.githubusercontent.com/BenBergman/.zsh/master/install.sh | sh
```

##Manual install

To use this setup, you must first clone the repository.

```bash
$ git clone --recursive git://github.com/BenBergman/.zsh.git ~/.zsh
```
or if you are me

```bash
$ git clone --recursive git@github.com:BenBergman/.zsh.git ~/.zsh
```

Lastly, you will have to symlink `.zshrc` into `~`

```bash
$ ln -s ~/.zsh/.zshrc ~/.zshrc
```

Alternatively, you can create a `.zshrc` that includes the one from this repository

```bash
$ echo -e '. ~/.zsh/.zshrc' >> ~/.zshrc
```

You will also need to build Wunderprompt.

```bash
$ cd ~/.zsh/wunderprompt && make
```

I have made some effort to make my configuration cross platform compatible, but I use Windows and Mac so rarely that many of the features have not been fully tested on those platforms. Feel free to report any problems you encounter or submit fixes.

## TODO:

* Simplify zshrc
  * Break zshrc into smaller related chunks
  * Move any chunks that could be shared between shells (aliases, etc.) into a submodule

[zsh]:http://www.zsh.org
