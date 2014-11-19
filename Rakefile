require './lib/os'

task :default => [:update]

desc 'Upadate repo and submodules'
task :update do
  print 'Pulling changes... '
  verbose(false) { sh "git pull" }
  print 'Updating submodules... '
  verbose(false) { sh "git submodule update --init" }
  puts 'Done!'
end

desc 'Link config files on HOME folder'
task :link do
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
  sh "sudo aptitude install build-essential git-core" if OS.linux?
end

namespace :setup do
  desc 'Run all setup tasks'
  task :all => [:vim, :git, :osx]

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

def home_dir
  Dir.respond_to?(:home) ? Dir.home : ENV['HOME']
end

def update_link(origin, dest)
  origin = "#{Dir.pwd}/#{origin}"
  dest = "#{home_dir}/#{dest}"

  puts "Linking #{origin} to #{dest}"

  verbose false do
    rm dest if File.exists? dest
    ln_s origin, dest
  end
end
