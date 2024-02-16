if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting 
    set TERM screen-256color 
    pokemon-colorscripts -r --no-title
end

zoxide init --cmd cd fish | source
