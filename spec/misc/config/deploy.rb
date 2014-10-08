# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'my_app_name'
set :repo_url, 'https://github.com/udzura/puppet-tester.git'

set :deploy_to, '/var/puppet'
set :scm, :git
set :log_level, :debug

# Default value for :pty is false
# set :pty, true
