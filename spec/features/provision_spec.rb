describe 'cap basic tasks' do
  describe '$ cap -T' do
    it 'should contain provison task' do
      Dir.chdir './spec/misc' do
        stdout, stderr, exitinfo = run_and_capture('bundle exec cap -T')
        expect(stdout).to match /^cap provision/
        expect(stderr).to be_empty
        expect(exitinfo.exitstatus).to be 0
      end
    end
  end
end
