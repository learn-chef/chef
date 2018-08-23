#
# Cookbook:: loadbalancer
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update
package 'haproxy'

template '/etc/haproxy.cfg' do
    source 'haproxy.cfg.erb'
end

service 'haproxy' do
    action [:enable, :start]
end