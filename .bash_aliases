# Make NeoVIM preferred vim
alias vim='nvim'

# Change fast to working dirs
alias cdd='cd ~/dev'
alias cdg='cd ~/dev/git'
alias cdgl='cd ~/dev/gitlab'
alias cdl='cd ~/dev/local'
alias cdc='cd ~/dev/gitlab/customers'
alias cde='cd ~/dev/gitlab/external'
alias cdi='cd ~/dev/gitlab/internal'
alias cdv='cd ~/dev/gitlab/internal/vagrant/puppetcoding'
alias cdp='cd ~/dev/gitlab/internal/puppet_modules'
alias cdtf='cd ~/dev/gitlab/internal/terraform'
alias cdptf='cd ~/dev/gitlab/internal/p_terraform'

# Vagrant handy shortcuts
alias vdes='vagrant destroy'
alias vres='vagrant resume'
alias vssh='vagrant ssh'
alias vstat='vagrant status'
alias vsus='vagrant suspend'
alias vup='vagrant up'

# Terraform
alias tf='terraform'
alias tfmt='terraform fmt -recursive'

#Crypto
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

# Kubernetes
alias kc='kubectl'

# Asciinema
alias ascp='asciinema play'
alias ascr='asciinema rec'
