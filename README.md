# cpponvim

This is an attempt at providing a working, versioned, well documented configuration for programming in C++ on Ubuntu using NeoVim.

NeoVim is basically the Vim editor rewritten for more speed and plugin potential. If you are a Vim user, you will be able to use it without any learning step. If you are not a vim user, then any tutorial for Vim will apply to NeoVim.
NeoVim can be installed using apt-get on Ubuntu so don't worry about the installation.

## Environment

* Ubuntu 18.04 

  Note: Headless (server) version is supported, as normally expected with vim.

## Installation

* Checkout this repository and copy the init.vim file from it to your filesystem:
  ```
  git clone https://github.com/klosworks/cpponvim.git
  mkdir ~/.config
  mkdir ~/.config/nvim
  mkdir ~/.config/nvim/init.vim
  cp .config/nvim/init.vim ~/.config/nvim/
  ```

* install c++ tools
  ```
  sudo install build-essential gdb 
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
  The last command may hang at YouCompleteme.

* Install the compiled plugin components
  ```
  cd ~/.vim/bundle/YouCompleteMe
  git submodule update --init --recursive
  python3 install.py --clang-completer
  ```
  YouCompleteMe is perhaps the most important plugin for development in C++ because it provides functionality like go-to-definition, context help and automatic error detection.
  
  For some reason, this command sometimes fails with the following error:
  ```
  CMake Error: The source directory "/home/(...)/YouCompleteMe/third_party/ycmd/third_party/cregex" does not appear to contain CMakeLists.txt
  ```
  If that happens, do the following, to remove the problematic directory and rebuild the compiled plugin:
  ```
  rm -fr third_party/ycmd/third_party/cregex
  git submodule update --init --recursive
  python3 install.py --clang-completer
  ```
  
* If the :PluginInstall command hanged before, rerun it.
  ```
  vim
  :PluginInstall
  ```
  
* Open vim and update the remote python plugins.
  ```
  vim
  :UpdateRemotePlugins
  ```
  This is needed for Chromatica.vim which provides semantic highlighting (such as coloring depending on whether a variable is a class member or a local variable). This should not be confused with syntax highlighting (such as coloring a keyword or a comment differently than a variable name), which is already supported by vim and doesn't need a plugin.
  

* That's it! you should have a working nvim setup for C++!

## Project setup: Enabling C++ context help features and semantic highlighting

To enable the smart features of installed vim plugins, the C++ project
needs to have a **compile_commands.json** file created by your build system at the folder where you open vim, or a subfolder. This file should be autogenerated. The CMake build system supports generating it. To enable it, you need to add `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON ` argument to you `cmake` invocation, and then copy the resulting *compile_commands.json* file to the root of your project.

## A "Hello World" project to test the setup

You can test your setup with the following Hello World project. Just copy the 3 following files into a single folder and build it.

*build.sh*
```
mkdir -p build
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
(cd ..; ln -s build/compile_commands.json compile_commands.json)
make -j8
```

*main.cpp*:
```
#include<iostream>
 
int main()
{
   std::cout << "Hello World!" << std::endl;
}
```

*CMakeLists.txt*
```
cmake_minimum_required(VERSION 2.8.9)
project (hello)
add_executable(hello main.cpp)
```

Build it with:
```
bash build.sh
```

You should have compile_commands.json link appear in the root of your project.

You can run the hello application like this:
```
build/hello
```
It should output
```
Hello World!
```

Now you can enjoy the features of this vim setup.
Run
```
vim main.cpp
```

You should see features like semantic highlighting and context help.

Please, test context help it by typing `std::cout.` inside main function and then hitting ctrl+space. You should see hints appear, like this:
![](images/screenshot_context_help.png)

Note: 
open vim from the root of your project.
Even if you have subfolders such as `src/package1/module3/ddd.cpp` have console open in the parent of src and open ddd.cpp like this:
```
vim src/package1/module3/ddd.cpp
```
This will ensure that the current working directory in vim is the root of your project, compile_commands.json is found and plugins work correctly.

## More advance use of the plugins

* Look online at NERDTree plugin documentation for some basic navigation within a project directory tree. 
* Read ~/.config/nvim/init.nvim file. You will find that it is pretty well documented inside. Please try various commands defined using the nnoremap and inoremap commands. 
Hints:
  * Some contents are folded. To unfold, place your cursor on a folded line and type `zo`. To fold back, type `zc`.
  * the `<leader>` key is defined as ',' (the comma).
  * Chromatica sometimes has issues, particularly with headers. If you don't like the highliting by Chromatica and would like a more consistent but less powerful highlighting, do `:ChromaticaStop`. This will revert to the default vim highlighting for C++.
