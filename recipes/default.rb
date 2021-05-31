#
# Cookbook Name:: dmi
# Recipe:: default
#
# Copyright 2017, Criteo
#
# All rights reserved - Do Not Redistribute
#

ohai 'reload_dmi' do
  plugin 'dmi'
  action :nothing
end

reboot 'Apply dmidecode installation' do
  action :nothing
end

case node['platform_family']
when 'windows'
  windows_package node['dmi']['package']['name'] do
    source node['dmi']['package']['url']
    checksum node['dmi']['package']['sha256sum']
    installer_type :inno
    options '/SILENT'
  end

  # https://github.com/opscode-cookbooks/git/pull/19/files
  ENV['PATH'] += ";#{node['dmi']['path']}"
  env 'add dmi to path' do
    key_name 'path'
    action :modify
    delim ::File::PATH_SEPARATOR
    value node['dmi']['path'].tr('/', '\\')
    notifies :request_reboot, 'reboot[Apply dmidecode installation]'
  end
when 'rhel', 'debian'
  package 'dmidecode' do
    version node['dmi']['package']['version'] if node['dmi']['package']['version']
    options node['dmi']['package']['options'] if node['dmi']['package']['options']
    notifies :reload, 'ohai[reload_dmi]', :immediately
  end
end
