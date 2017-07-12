apt_repository 'juju' do
  uri 'http://ppa.launchpad.net/juju/stable/ubuntu'
  components ['main']
  distribution 'xenial'
  key 'C8068B11'
  keyserver 'keyserver.ubuntu.com'
  action :add
  deb_src true
end