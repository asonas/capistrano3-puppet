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

  desc 'Run puppet apply'
  task :apply do
    on roles(puppet_roles) do
      within release_path do
        execute :puppet, :apply, "--modulepath=#{modulepath}", manifest_file
      end
    end
  end
end

after "deploy:published", "puppet:apply"

desc 'Run the provisioning processes by puppet'
task :provision

after :provision, :deploy
