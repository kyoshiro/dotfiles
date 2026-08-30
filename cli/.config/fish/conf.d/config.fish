set -x VISUAL nvim
set -x EDITOR nvim

# cursor shape set by fish_vi_cursor
set -g fish_cursor_default block
set -g fish_cursor_insert block
set -g fish_cursor_visual block
set -g fish_escape_delay_ms 10


function fish_greeting
  if test -r /etc/os-release
      set -l os_id (grep '^ID=' /etc/os-release | cut -d= -f2 | string trim -c '"')
      if test "$os_id" = ubuntu
         fastfetch --logo ubuntu
      else
         fastfetch
      end
  end
end

# hide greeting
set fish_greeting ""

starship init fish | source
