apt_repository 'mongodb-org' do
  components ['multiverse']
  key 'EA312927'
  action :add
  deb_src true
  uri 'hkp://keyserver.ubuntu.com:80'
end
