#
# Cookbook Name:: yum-repos
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum"

# add the EPEL repo
yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
  fastestmirror_enabled true
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  enabled false
  action :create
end

# add the Remi repo
yum_repository 'remi' do
  description 'Les RPM de Remi - Repository'
  baseurl 'http://rpms.famillecollet.com/enterprise/6/remi/x86_64/'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  enabled false
  action :create
end

# add the RPMForge repo
yum_repository 'rpmforge' do
  mirrorlist 'http://mirrorlist.repoforge.org/el6/mirrors-rpmforge'
  description 'RHEL $releasever - RPMforge.net - dag'
  enabled false
  gpgcheck true
  gpgkey 'http://apt.sw.be/RPM-GPG-KEY.dag.txt'
end

#
# nginxの最新版を取得するためのレポジトリを追加
#
template "/etc/yum.repos.d/nginx.repo" do
  source 'nginx.repo'
  owner "root"
  group "root"
  mode  "0644"
end
