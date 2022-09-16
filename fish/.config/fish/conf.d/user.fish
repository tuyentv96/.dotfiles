# clear terminal 
function fish_user_key_bindings
    bind \cn 'clear; commandline -f repaint'
end

# exit
function fish_user_key_bindings
    bind \cs 'exit'
end
