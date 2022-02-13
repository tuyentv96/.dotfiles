if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

set -gx GOROOT /usr/local/opt/go/libexec
set -gx PATH $HOME/go/bin $PATH
set -gx PATH $GOROOT/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/Library/Application Support/Coursier/bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH $HOME/.pyenv/bin $PATH
set -gx PATH $HOME/.pyenv/versions/3.7.3/bin $PATH

set -gx PATH /usr/local/opt/openjdk@8/bin $PATH
set -gx LIBRARY_PATH $LIBRARY_PATH /usr/local/lib
set -gx PATH /Users/tuyen/.local/share/solana/install/active_release/bin $PATH
set -gx PATH /usr/local/opt/libpq/bin $PATH
# set -gx LDFLAGS "-L/usr/local/opt/libpq/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/libpq/include"
# pyenv init - | source
# pyenv virtualenv-init - | source
set -gx LDFLAGS "$LDFLAGS -L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
set -gx CPPFLAGS "$CPPFLAGS -I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
