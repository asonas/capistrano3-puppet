# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'cap_puppet_sample'
set :repo_url, 'file://localhost/var/repo/puppet'

set :deploy_to, '/var/puppet'
set :scm, :git
set :log_level, :debug

# Default value for :pty is false
# set :pty, true
