#
# Cookbook Name:: opencpu
# Recipe:: default
#
# Author: Steve Nolen <technolengy@gmail.com>
#
# Copyright (c) 2014.
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
include_recipe "apt"

#almost all users will want the stable release, but add support for legacy release as well.
case node['opencpu']['release']
when "stable"

 #opencpu-1.4 ppa tested as working only on 14.04
 case node['lsb']['codename']
 when "trusty"
  apt_repository 'opencpu-1.4' do
   uri          'ppa:opencpu/opencpu-1.4'
   distribution node['lsb']['codename']
  end
  package 'opencpu' do
   action :install
  end
  service 'opencpu' do
   action [:start, :enable]
   supports :restart => true
  end

when "legacy"
 
 #ohmage-2.13 ppa wont work newer than on 12.04
 case node['lsb']['codename']
 when "trusty"
  apt_repository 'ohmage-2.13' do
   uri 'ppa:opencpu/ohmage-2.13'
   distribution node['lsb']['codename']
  end
  package 'ohmage-viz'
   action :install
  end
  service 'opencpu-server' do
   action [:start, :enable]
   supports :restart => true
  end
 end

end