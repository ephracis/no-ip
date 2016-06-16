require 'spec_helper'

describe 'no-ip::default' do
  context 'When all attributes are default, on an unspecified platform' do
    include ChefVault::TestFixtures.rspec_shared_context

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs expect' do
      expect(chef_run).to install_package('expect')
    end

    it 'downloads tarball' do
      expect(chef_run).to create_remote_file(
        File.join(Chef::Config[:file_cache_path], 'noip-duc-linux.tar.gz')
      )
    end

    it 'unpacks tarball' do
      expect(chef_run).to extract_tarball_x(
        File.join(Chef::Config[:file_cache_path], 'noip-duc-linux.tar.gz')
      )
    end

    it 'installs service' do
      expect(chef_run).to create_template('/etc/init.d/noip2')
    end

    it 'starts service' do
      expect(chef_run).to start_service('noip2')
    end
  end
end
