# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'open3'
module CommandRunner
  def __debug?
    !! ENV['DEBUG']
  end

  def __env
    return @__env if @__env
    @__env = {
      'PATH' => '/bin"/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
    }
    if have_boot2docker?
      docker_host = `echo tcp://$(boot2docker ip 2>/dev/null):2375`.chomp
      @__env['DOCKER_HOST'] = docker_host
    end
    @__env
  end

  def have_boot2docker?
    ! `which boot2docker`.empty?
  end

  def run(cmd)
    sout, *_ = run_and_capture cmd
    return sout
  end

  def run_and_capture(cmd)
    sout, serr, ex = Open3.capture3 __env, cmd

    if __debug?
      $stderr.puts "*** Command: #{cmd}"
      $stderr.puts "**** returned stdout:\n\n#{sout}\n"
      $stderr.puts "**** returned stderr:\n\n#{serr}\n"
      $stderr.puts "**** exited: #{ex.exitstatus}"
    end

    return sout, serr, ex
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.run_all_when_everything_filtered = true
  config.warnings = true
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random
  Kernel.srand config.seed

  config.include CommandRunner

  config.before :all do
    Dir.chdir './spec/misc' do
      run 'bundle install --path vendor/bundle'
    end
    run 'docker build -t cap3puppet/base spec/misc'
    run 'docker run -d -P --hostname \'cap3puppet.dev\' --name test_sshd cap3puppet/base'
  end

  config.after :all do
    run 'docker stop test_sshd'
    run 'docker rm test_sshd'
  end
end
