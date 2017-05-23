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

  # Copy to system clipboard using pbcopy (only MacOs)
  def copy
    self.public_send('|', 'pbcopy')
    self
  end
end

# Copy to system clipboard using pbcopy (only MacOs)
def copy(obj)
  obj.to_s.copy
end

# Cleanup current shell
def clear
  system 'clear'
end


# Make all private methods public for the given object
def make_public(obj)
  obj.private_methods.each do |method_name|
    obj.singleton_class.class_eval { public method_name }
  end
  obj
end
