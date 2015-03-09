# Bundler bootstrap
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'bundler/capistrano'
# RVM integration
require "rvm/capistrano"
set :rvm_ruby_string, '2.1.2'
set :rvm_type, :user
# main details
set :application, "104.239.144.69"
role :web, "104.239.144.69"
role :app, "104.239.144.69"
role :db, "104.239.144.69", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/home/deployer/quote_app"
set :user, "deployer"
set :use_sudo, false

# repo details
set :scm, :git
set :repository, "git@github.com:isotope11/quote_app.git"
set :branch, "master"
set :git_enable_submodules, 1

# tasks
namespace :deploy do
  before 'deploy:setup', :db

  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

# task :which_ruby, :roles => :app do
#   run "ruby --version"
# end

after 'deploy:finalize_update', 'deploy:symlink_shared'
after 'deploy:restart',         'deploy:cleanup'
# before 'bundle:install', 'which_ruby'
