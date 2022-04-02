## ~ernie/.vim

### Installation:

* Install neovim and other needed executables
    * `brew install neovim fd rg`
* Install Neovide
    1. Install the latest version of Rust. Using homebrew: `brew install rustup-init`
    2. Configure rust by running `rustup-init`
    3. Install CMake. Using homebrew: `brew install cmake`
    4. `git clone https://github.com/neovide/neovide`
    5. `cd neovide`
    6. `cargo install cargo-bundle`
    7. `cargo bundle --release`
    8. Copy `./target/release/bundle/osx/Neovide.app` to `~/Applications`
    9. `ln -s ~/Applications/Neovide.app/Contents/MacOS/neovide ~/bin/`
* `git clone https://github.com/ernie/dotvim.git ~/.vim`
* Launch Neovide
* `:PlugInstall`
