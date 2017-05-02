require 'spec_helper'

describe package('docker'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe service('docker'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe docker_container('root_nginx_1') do
  it { should be_running }
end

describe docker_container('root_redis_1') do
  it { should be_running }
end

describe docker_container('root_postgres_1') do
  it { should be_running }
end

describe docker_container('root_server_1') do
  it { should be_running }
end

describe docker_container('root_worker_1') do
  it { should be_running }
end

describe file('/usr/local/bin/docker-compose') do
    it { should be_mode 744 }
end

describe yumrepo('epel') do
    it { should exist }
    it { should be_enabled }
end

