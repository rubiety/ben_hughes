$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'

require "bundler/capistrano"

set :rvm_ruby_string, "1.9.2-p290"

set :application, "ben_hughes"
set :repository, "git@github.com:rubiety/#{application}"

set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :ssh_options, {:forward_agent => true}
ssh_options[:port] = 2234

set :user, "apps"
set :use_sudo, false
set :deploy_to, "/var/www/benhughes.name"
set :main_server, "benhughes.name"

role :web, main_server
role :app, main_server
role :db, main_server, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path, "tmp", "restart.txt")}"
  end
end
