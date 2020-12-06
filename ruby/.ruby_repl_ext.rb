# Ruby repl extensions (irb/pry)

%w(rubygems pp awesome_print interactive_editor).each do |gem|
  begin
    require gem
  rescue LoadError
  end
end

class String
  # This extension adds a UNIX-style pipe to strings
  # => puts 'foobar' | 'wc'
  def |(cmd)
    IO.popen(cmd.to_s, 'r+') do |pipe|
      pipe.write(self)
      pipe.close_write
      pipe.read.strip
    end
  end

  # Copy to system clipboard
  def copy
    self.public_send('|', 'copy')
    self
  end
end

# Copy to system clipboard
def copy(obj)
  obj.to_s.copy
end

# Cleanup current shell
def clear
  system 'clear'
end
