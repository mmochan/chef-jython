#
# Cookbook Name:: jython
# Recipe:: default
#
# Copyright 2012, Mark Roddy


version = node["jython"]["version"]
java = "#{node['java']['java_home']}/bin/java"
installdir = "#{node['jython']['install_root']}/jython-#{version}"
bin = "#{installdir}/bin/jython"
jar = "#{Chef::Config[:file_cache_path]}/jython-#{version}.jar"

remote_file jar do
  source node["jython"]["versions"][version]["remote_jar"]
  checksum node["jython"]["versions"][version]["jar_checksum"]
end

execute "Install From Jar" do
  command "#{java} -jar #{jar} --silent --type standard --directory #{installdir}"

  # Running --version as a sanity check beyond check if
  # file exists on disk
  not_if "test -x #{bin} && #{bin} --version"
end

link "#{node["jython"]["bin_directory"]}/jython-#{version}" do
  to bin
end

if node["jython"]["package_cache_writable"] then
  cache_dir_mod = "0777"
else
  cache_dir_mod = "0755"
end

# Create the package cache directory, this prevents errors like the following
# *sys-package-mgr*: can't create package cache dir, '/usr/lib/jython-2.5.3/cachedir/packages'
directory "#{installdir}/cachedir/packages" do
  owner "root"
  group "root"
  mode  cache_dir_mod
  action :create
  recursive true
end

# Run jython with noop command to import all of the packages on your class path
execute "import packages" do
  command "#{bin} -c 'import sys; sys.exit(0);'"
  timeout 10
  environment( {"CLASSPATH" => node["jython"]["classpath"]} )
end
