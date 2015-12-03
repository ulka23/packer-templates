require 'fileutils'

describe 'subversion installation' do
  describe command('svn --version') do
    its(:exit_status) { should eq 0 }
  end

  describe 'subversion commands are executed' do
    before do
      FileUtils.rm_rf('svn-project')
      system('svnadmin create svn-project', [:out, :err] => '/dev/null')
    end

    describe file('svn-project/README.txt') do
      its(:content) { should match 'This is a Subversion repository;' }
    end
  end
end
