#
# Cookbook:: loadbalancer
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update
package 'haproxy'

directory '/etc/haproxy'

template '/etc/haproxy/haproxy.cfg' do
    source 'haproxy.cfg.erb'
    notifies :restart, 'service[haproxy]'
end

service 'haproxy' do
    action [:enable, :start]
end
