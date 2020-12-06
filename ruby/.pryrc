# common ruby repl settings
require_relative '.ruby_repl_ext'

Pry.editor = 'vim'
Pry.config.color = true

# Show rails environment and project name
Pry.config.prompt = PryRails::RAILS_PROMPT if defined?(PryRails::RAILS_PROMPT)

if defined?(PryByebug)
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
end

# Use awesome print automatically when inspecting stuff
AwesomePrint.pry! if defined?(AwesomePrint)
