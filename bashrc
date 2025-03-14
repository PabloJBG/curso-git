# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


# Escritorio remoto
alias RDP='toolbox run --container dev-rdp remmina'

# Ejecutar PSX
alias PSX='toolbox run --container dev-java11 bash -c '"'"'
cd ~/Downloads
shopt -s nullglob
files=(*.jnlp)
if [ ${#files[@]} -eq 0 ]; then
  echo "No hay archivos JNLP en ~/Downloads"
  exit 1
fi
echo "Selecciona un archivo:"
select file in "${files[@]}"; do
  if [[ -n "$file" ]]; then
    /opt/OpenWebStart/javaws "$file"
    break
  else
    echo "Opción no válida"
  fi
done
'"'"''
