# my_dot_files

This is an attempt at providing a working, versioned, well documented configuration for programming in C++ on Ubuntu using NeoVim.

NeoVim is basically the Vim editor rewritten for more speed and plugin potential. If you are a Vim user, you will be able to use it without any learning step. If you are not a vim user, then any tutorial for Vim will apply to NeoVim.
NeoVim can be installed using apt-get on Ubuntu so don't worry about the installation.

## Environment

* Ubuntu 18.04 
Note: Headless (server) version is supported, as normally expected with vim.

## Installation

* install c++ tools
```
sudo install build-essential gdb 
```

* copy the init.vim file to your filesystem:
```
mkdir ~/.config
mkdir ~/.config/nvim
mkdir ~/.config/nvim/init.vim
cp .config/nvim/init.vim ~/.config/nvim/
```

* Install nvim:
```
sudo apt install nvim
```
This installs version 0.2.2 at the time of writing this.

* Set your vim command to neovim:
```
update-alternatives --config vim
```
The command will list all flavours of vim installed and prompt you to select one by typing a corresponding digit. Do that.

* Install plugin dependencies:

For YouCompleteMe:
```
sudo apt install build-essential cmake python3-dev
```
For chromatica
```
sudo apt install libclang-dev
sudo apt install python3-pip
sudo pip3 install --upgrade pynvim
```
* Open vim and download plugins (most are installed by downloading):
```
vim
:PluginInstall
```

* Install the compiled plugin components
```
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
```

* When you open vim, it will prompt you to update remote python plugins and it will tell you what vim command to run to that end. Do that.


* That's it! you should have a working nvim setup for C++!

## Project setup: Enabling C++ context help features and semantic highlighting

To enable the smart features of installed vim plugins, the C++ project
needs to have a compile_commands.json file created by your build system at the folder where you open vim, or a subfolder.

A typical script for building a project this way using CMake is as follows:
```
mkdir -p build
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
(cd ..; ln -s build/compile_commands.json compile_commands.json)
make -j8
```

Please, find a Hello World application for CMake, copy the above to a build.sh script and run it in order to test your setup.

You should have compile_commands.json file appear in the root of your project, and features like semantic highlighting (e.g. members with different color than globals) and context help (such as actual class members proposed when hitting ctrl+space after typing a dot).

Note: 
open vim from the root of your project.
Even if you have subfolders such as `src/package1/module3/ddd.cpp` have console open in the parent of src and open ddd.cpp like this:
```
vim src/package1/module3/ddd.cpp
```
This will ensure that the current working directory in vim is the root of your project, compile_commands.json is found and plugins work correctly.

## Using the plugins

* Look online at NERDTree plugin documentation for some basic navigation within a project directory tree. 
* Read ~/.config/nvim/init.nvim file. You will find that it is pretty well documented inside. Please try various commands defined using the nnoremap and inoremap commands. Hint: the <leader> key is defined as ',' (the comma).
