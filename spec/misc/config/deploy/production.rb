if `which boot2docker`.empty?
  hostname = 'localhost'
else
  hostname = `boot2docker ip 2>/dev/null`.chomp
end
hostname = ENV['HOSTNAME'] if ENV['HOSTNAME']

port_string = `docker port test_sshd 22`
port = port_string.split(':')[1].to_i unless port_string.empty?

set :puppet_roles, :app
set :puppet_modulepath, "modules"
set :puppet_manifest_file, "manifests/site.pp"

puts "%s:%d" % [hostname, port]

server hostname,
  roles: %w{app},
  ssh_options: {
    port: port,
    user: 'root',
    keys: %w(./id_dsa),
    forward_agent: false,
    auth_methods: %w(publickey)
  }
