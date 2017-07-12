#
# Cookbook:: mongo
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
apt_repository 'mongodb-org' do
  uri 'http://repo.mongodb.org/apt/debian'
  distribution node['lsb']['codename'] + '/mongodb-org/3.2'
  components ['main']
  arch 'amd64'
  keyserver 'hkp://keyserver.ubuntu.com'
  key 'EA312927'
  action :add
end

