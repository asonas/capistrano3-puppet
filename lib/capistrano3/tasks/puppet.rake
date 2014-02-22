namespace :puppet do

  def modulepath
    fetch(:puppet_modulepath, "")
  end

  def manifest_file
    fetch(:puppet_manifest_file, "")
  end

  def delayed_job_roles
    fetch(:puppet_role, :app)
  end

  desc 'puppet apply'
  task :apply do
    on roles(puppet_roles) do
      within release_path do
        execute :puppet, :apply, "--modulepath=#{modulepath}", manifest_file
      end
    end
  end

end
