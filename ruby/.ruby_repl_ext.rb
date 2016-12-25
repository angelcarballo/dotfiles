# Ruby repl extensions (irb/pry)

%w(rubygems pp awesome_print interactive_editor).each do |gem|
  begin
    require gem
  rescue LoadError
  end
end

# This extension adds a UNIX-style pipe to strings
# => puts 'foobar' | 'wc'
class String
  def |(cmd)
    IO.popen(cmd.to_s, 'r+') do |pipe|
      pipe.write(self)
      pipe.close_write
      pipe.read.strip
    end
  end
end