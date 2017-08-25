# common ruby repl settings
require_relative '.ruby_repl_ext'

Pry.editor = 'vim'
Pry.config.color = true

if defined?(PryRails::RAILS_PROMPT)
  Pry.config.prompt = PryRails::RAILS_PROMPT
end

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'

# Use ap when inspecting stuff
AwesomePrint.pry! if defined?(AwesomePrint)
