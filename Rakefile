require './lib/os'

task :default => [:update, :bootstrap]

task :update do
  print 'Pulling changes... '
  verbose false do
    sh "git pull"
  end
  print 'Updating submodules... '
  verbose false do
    sh "git submodule update --init"
  end
  puts 'done!'
end

task :bootstrap do
  print 'Installing... '

  # Vim
  update_link 'vim', '.vim'
  update_link 'vim/vimrc', '.vimrc'
  update_link 'vim/gvimrc', '.gvimrc'
  verbose(false) { sh "vim +PluginInstall! +qall" }  # install and/or update vundle plugins
  verbose(false) { sh "vim +PluginClean! +qall" }  # clean unused vundle plugins

  # Ruby
  update_link 'ruby/gemrc', '.gemrc'
  update_link 'ruby/irbrc', '.irbrc'

  # Bash
  update_link 'bash/bash_common', '.bash_common'
  update_link 'bash/bash_aliases', '.bash_aliases'

  # Tmux
  update_link 'tmux/tmux.conf', '.tmux.conf'

  # Mac OSX defaults
  verbose(false) { sh "#{Dir.pwd}/osx/set-defaults.sh" } if OS.mac?

  puts 'done!'
end


task :install_dep do
  sh "sudo aptitude install cmake python-dev exuberant-tags" if OS.linux?
  sh "brew install ctags" if OS.mac?
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

