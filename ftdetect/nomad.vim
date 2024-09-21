au BufRead,BufNewFile *.nomad                set filetype=hcl

autocmd BufRead,BufNewFile */provisioner/*.yml  set ft=yaml.ansible
autocmd BufRead,BufNewFile *.j2,*/provisioner/*/templates/* set ft=config.jinja2
