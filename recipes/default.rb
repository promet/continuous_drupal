#
# Cookbook Name:: continuous_drupal
# Recipe:: default
#
# Copyright (C) 2013 Will Milton
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "drupal"
include_recipe "drupal::drush"
include_recipe "jenkins::server"
include_recipe "jenkins::proxy_nginx"

# sledgehammer for integration tests
drupal_site "drupal-demo.jenkins.kasper.reload.dk"

execute "pear config-set auto_discover 1"

php_pear "PEAR" do
  action :upgrade
end

php_pear 'phpqatools' do
  channel 'pear.phpqatools.org'
end
php_pear 'phpDox' do
  channel 'pear.netpirates.net'
  preferred_state 'beta'
end

phing = php_pear_channel "pear.phing.info" do
  action :discover
end

pdepend = php_pear_channel "pear.pdepend.org" do
  action :discover
end

phpmd = php_pear_channel "pear.phpmd.org" do
  action :discover
end

phpunit = php_pear_channel "pear.phpunit.de" do
  action :discover
end

ez = php_pear_channel "components.ez.no" do
  action :discover
end

php_pear_channel "pear.symfony.com" do
  action :discover
end

php_pear_channel "pear.netpirates.net" do
  action :discover
end

php_pear "sqlite" do
  action :install
end

php_pear "phing" do
  channel phing.channel_name
  action :install
end

php_pear "phpcpd" do
  channel phpunit.channel_name
  action :install
end

php_pear "phploc" do
  channel phpunit.channel_name
  action :install
end

php_pear "PHPDocumentor" do
  action :install
end

php_pear "PHP_CodeSniffer" do
  action :install
end

php_pear "HTTP_Request2" do
  action :install
end

php_pear "PHP_CodeBrowser" do
  channel phpunit.channel_name
  action :install
  options "-a"
end

