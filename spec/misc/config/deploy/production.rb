hostname = ENV['HOSTNAME'] || 'example.dev'
port     = ENV['PORT'] || 22

set :puppet_roles, :app
set :puppet_modulepath, "modules"
set :puppet_manifest_file, "manifests/site.pp"

server hostname,
  roles: %w{app},
  ssh_options: {
    port: port,
    user: 'root',
    keys: %w(./id_dsa),
    forward_agent: false,
    auth_methods: %w(publickey)
  }
