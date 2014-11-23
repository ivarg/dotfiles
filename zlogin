#
# dotzsh : https://github.com/dotphiles/dotzsh
#
# Executes commands at login post-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Ben O'Hara <bohara@gmail.com>
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  dump_file="$HOME/.zcompdump"
  if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -s "${dump_file}.zwc" ]]; then
    # zcompile "$dump_file"
  fi

  # Set environment variables for launchd processes.
  if [[ "$OSTYPE" == darwin* ]]; then
    for env_var in PATH MANPATH; do
      launchctl setenv "$env_var" "${(P)env_var}" 2>/dev/null
    done
  fi
} &!


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

