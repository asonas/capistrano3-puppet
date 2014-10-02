set :puppet_roles, :app
set :puppet_modulepath, "modules"
set :puppet_manifest_file, "manifests/site.pp"

server '192.168.59.103',
  roles: %w{app},
  ssh_options: {
    port: 49161,
    user: 'root', # overrides user setting above
    keys: %w(./id_dsa),
    forward_agent: false,
    auth_methods: %w(publickey)
  }
