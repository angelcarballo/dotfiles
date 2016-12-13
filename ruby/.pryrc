# common ruby repl settings
require_relative '.ruby_repl_ext'

Pry.editor = 'vim'
Pry.config.color = true

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Use ap when inspecting stuff
AwesomePrint.pry!
