namespace :puppet do

  def modulepath
    fetch(:puppet_modulepath, "")
  end

  def manifest_file
    fetch(:puppet_manifest_file, "")
  end

  def puppet_roles
    fetch(:puppet_role, :app)
  end

  def puppet_options
    options = fetch(:puppet_role, nil)
    unless options
      options = ["--modulepath=#{modulepath}"]
      options << "--noop" if ENV['NOOP']
    end
    options
  end

  desc 'Run puppet apply'
  task :apply do
    on roles(puppet_roles) do
      within release_path do
        if fetch(:use_sudo, false)
          execute :sudo, :puppet, :apply, *puppet_options, manifest_file
        else
          execute :puppet, :apply, *puppet_options, manifest_file
        end
      end
    end
  end
end

after "deploy:published", "puppet:apply"

desc 'Run the provisioning processes by puppet'
task :provision

after :provision, :deploy
