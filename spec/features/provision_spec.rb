describe 'cap basic tasks' do
  describe '$ cap -T' do
    it 'should contain provison task' do
      Dir.chdir './spec/misc' do
        stdout, stderr, exitinfo = run_and_capture('bundle exec cap -T')
        expect(stdout).to match(/^cap provision/)
        expect(stderr).to be_empty
        expect(exitinfo.exitstatus).to be 0
      end
    end
  end

  describe '$ cap production provision' do
    let(:hostname) { have_boot2docker? ? run('boot2docker ip 2>/dev/null').chomp : 'localhost' }
    let(:port)     { run('docker port test_sshd 22').split(':')[1].chomp rescue "22" }

    it 'should run a provisioning successfully' do
      Dir.chdir './spec/misc' do
        stdout, stderr, exitinfo = run_and_capture("HOSTNAME=#{hostname} PORT=#{port} bundle exec cap production provision")
        expect(stdout).to include('Running /usr/bin/env puppet apply --modulepath=modules manifests/site.pp')
        expect(stdout).to include('Notice: Scope(Class[Sample]): hello, world!')
        expect(exitinfo.exitstatus).to be 0
      end
    end
  end
end
