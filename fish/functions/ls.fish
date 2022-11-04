function ls --wraps='exa -la' --description 'alias ls=exa -la'
  exa -la $argv; 
end
