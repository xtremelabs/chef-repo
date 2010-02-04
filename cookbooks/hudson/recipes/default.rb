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
package "sun-java6-jdk"
package "openjdk-6-jdk" do
  action :remove
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
