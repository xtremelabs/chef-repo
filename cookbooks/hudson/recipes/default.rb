#
# Cookbook Name:: hudson
# Recipe:: default
#
# Copyright 2010, Example Com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

execute "update-java-alternatives" do
  command "update-java-alternatives -s java-6-sun"
  only_if do platform?("ubuntu", "debian") end
  ignore_failure true
  action :nothing
end

package "sun-java6-jdk" do
  response_file "java.seed"
  action :install
  notifies :run, resources(:execute => "update-java-alternatives"), :immediately
end

package "monit"

package "git-core"
package "subversion"

package "ruby1.8"
package "ruby1.8-dev"
package "libopenssl-ruby1.8"
package "mysql-server"
package "irb1.8"
package "rake"
package "libxml2-dev"
package "libxslt1-dev"

user "hudson" do
  comment "Hudson User"
end

user "xtremelabs" do
  comment "XtremeLabs User"
  home "/home/xtremelabs"
end

directory "/root/Downloads"

remote_file "/root/Downloads/android-sdk_r04-linux_86.tgz" do
  source "http://dl.google.com/android/android-sdk_r04-linux_86.tgz"
  mode "0644"
  checksum "61f356de22f8d2069f970b638dfd6a6e23edad13c093a7f20e9f4415e8563a2d"
end

script "extract android" do
  not_if do File.exists?("/opt/android-sdk-linux_86") end
  interpreter "bash"
  cwd "/opt"
  code <<-EOH
    tar -zxf /root/Downloads/android-sdk_r04-linux_86.tgz
  EOH
end

