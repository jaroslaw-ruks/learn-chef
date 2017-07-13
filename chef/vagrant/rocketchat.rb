apt_update 'update' do
  frequency 86_400
  action :periodic
end

apt_repository 'mongodb' do
  components ['multiverse']
  key 'EA312927'
  action :add
  deb_src true
end


remote_file '/tmp/docker.deb' do
  source 'https://download.docker.com/linux/ubuntu/dists/trusty/pool/stable/amd64/docker-ce_17.03.0~ce-0~ubuntu-trusty_amd64.deb'
  owner 'vagrant'
  group 'vagrant'
  mode  '777'
  action :create
end

package 'libltdl7'
#package 'libsystemd-journal0'
package 'linux-image-extra-4.4.0-81-generic'
package 'linux-image-extra-virtual'

#dpkg_package '/tmp/docker.deb' do
 # source '/tmp/docker.deb'
  #action :install
#end

package 'bash-completion'
package 'mongodb-org'
package 'docker-ce'

file '/lib/systemd/system/mongod.service' do
 content '[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target
Documentation=https://docs.mongodb.org/manual

[Service]
User=mongodb
Group=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target'
  mode '0644'
  owner 'root'
  group 'root'
end

service 'mongod.service' do
  supports :status => true
  action [:enable, :start]
end

