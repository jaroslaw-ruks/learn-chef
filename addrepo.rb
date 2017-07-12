apt_repository 'mongodb-org-3.2' do 
  uri 'http://repo.mongodb.org/apt/ubuntu'
  components ['multiverse']	
  #distribution 'xenial/mongodb-org/3.2'
  distribution node['lsb']['codename'] + '/mongodb-org/3.2'
  arch 'amd64'
  keyserver 'hkp://keyserver.ubuntu.com'
  key 'EA312927'
  action :add
end

package 'mongodb-org'