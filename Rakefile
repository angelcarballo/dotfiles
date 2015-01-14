require './lib/os'

task :default => [:update]

desc 'Upadate repo and submodules'
task :update do
  print 'Pulling changes... '
  verbose(false) { sh "git pull" }
  print 'Updating submodules... '
  verbose(false) { sh "git submodule update --init" }
  puts 'Done!'
  Rake::Task['link'].execute
end

desc 'Link config files on HOME folder'
task :link do
  print 'Linking config files... '
  # vim
  update_link 'vim', '.vim'
  update_link 'vim/vimrc', '.vimrc'
  update_link 'vim/gvimrc', '.gvimrc'

  # ruby
  update_link 'ruby/gemrc', '.gemrc'
  update_link 'ruby/irbrc', '.irbrc'

  # bash
  update_link 'bash/dircolors/solarized', '.dircolors'
  update_link 'bash/bash_common', '.bash_common'
  update_link 'bash/bash_aliases', '.bash_aliases'

  # tmux
  update_link 'tmux/tmux.conf', '.tmux.conf'

  # rspec
  update_link 'rspec/rspec.conf', '.rspec'

  # rbenv
  update_link 'rbenv/default-gems', '.rbenv/default-gems'

  # git
  update_link 'git/gitignore_global', '.gitignore_global'

  puts 'Done!'
end

desc 'Install dependencies'
task :install_dep do
  if OS.linux?
    sh "sudo aptitude install build-essential git-core silversearcher-ag autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev"
  end
  if OS.mac?
    sh "brew install the_silver_searcher imagemagick openssl libyaml"
  end
end

desc 'Run all setup tasks'
task setup: ['setup:vim', 'setup:git', 'setup:osx']

namespace :setup do
  desc 'Vim related configuration (plugin installation and cleanup)'
  task :vim do
    verbose(false) { sh "vim +PluginInstall! +qall" }  # install and/or update vundle plugins
    verbose(false) { sh "vim +PluginClean! +qall" }  # clean unused vundle plugins
  end

  desc 'Git related configuration'
  task :git do
    verbose(false) { sh "#{Dir.pwd}/git/set-config.sh" }
    verbose(false) { sh "#{Dir.pwd}/git/set-aliases.sh" }
  end

  desc 'Mac OS X defaults'
  task :osx do
    verbose(false) { sh "#{Dir.pwd}/osx/set-defaults.sh" } if OS.mac?
  end
end

namespace :install do
  desc 'Install rbenv, ruby-build and ruby-default-gems'
  task :rbenv do
    `git clone https://github.com/sstephenson/rbenv.git ~/.rbenv`
    `git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build`
    `git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems`
  end
end

def home_dir
  Dir.respond_to?(:home) ? Dir.home : ENV['HOME']
end

def update_link(origin, dest)
  origin = "#{Dir.pwd}/#{origin}"
  dest = "#{home_dir}/#{dest}"

  verbose false do
    rm dest if File.exists? dest
    ln_s origin, dest
  end
end
