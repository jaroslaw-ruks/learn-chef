apt_repository 'mongodb-org' do 
  uri 'http://repo.mongodb.org/apt/ubuntu'
  components ['multiverse']	
  #distribution 'xenial/mongodb-org/3.2'
  distribution node['lsb']['codename']
  arch 'amd64'
  keyserver 'hkp://keyserver.ubuntu.com:80'
  key 'EA312927'
  action :add
end

package 'mongodb-org'


