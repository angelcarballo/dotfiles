task :default => [:update_submodules, :link]

task :update_submodules do
  sh "git submodule update --init"
end

task :link do
  home_dir = Dir.respond_to?(:home) ? Dir.home : ENV['HOME']
  source_dir = Dir.pwd
  puts "Linking scripts and config dir..."

#  if RUBY_PLATFORM.downcase.include? "w32"
#    `cd %HOMEPATH% && del _vimrc`
#    `cd %HOMEPATH% && del _gvimrc`
#    `cd %HOMEPATH% && copy #{windows_path File.join(source_dir, 'vimrc')}  _vimrc` 
#    `cd %HOMEPATH% && copy #{windows_path File.join(source_dir, 'gvimrc')} _gvimrc`
#    `xcopy /E /C #{windows_path source_dir} #{windows_path File.join(ENV['HOME'], 'vimfiles')}`
#    puts "xcopy /E /C #{windows_path source_dir} #{windows_path File.join(ENV['HOME'], 'vimfiles')}"
#  else
#    vimdir = File.join(home_dir, '.vim')
#    File.exist?(vimdir) ? warn('Vim dir already exists') : ln_s(Dir.pwd, File.join(home_dir, '.vim'))
#    %w(vimrc gvimrc).each do |script|
#      dotfile = File.join(home_dir, ".#{script}")
#      File.exist?(dotfile) ? warn("#{script} already exists") : ln_s(File.join(vimdir, script), dotfile)
#    end
#  end
end

def windows_path(path)
  path.gsub '/' , '\\'
end

def link_folder(source_dir, destination)
  if RUBY_PLATFORM.downcase.include? "w32"
    `xcopy /E /C #{windows_path source_dir} #{destination_dir}`  # /E: recursivo  /C: no detenerse en los errores
  else
    ln_s source_dir, destination
  end
end

def link(source, destination)
  if RUBY_PLATFORM.downcase.include? "w32"
    `xcopy /E /C #{windows_path source} #{destination}`  # /E: recursivo  /C: no detenerse en los errores
  else # mac, linux
    ln_s source, destination
  end
end
