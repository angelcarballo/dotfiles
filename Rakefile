task :default => [:update_submodules, :bootstrap]

task :update_submodules do
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

  # Ruby
  update_link 'ruby/gemrc', '.gemrc'
  update_link 'ruby/irbrc', '.irbrc'

  # Mac OSX defaults
  verbose(false) { sh "#{Dir.pwd}/osx/set-defaults.sh" }

  puts 'done!'
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
