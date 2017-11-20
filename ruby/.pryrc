# common ruby repl settings
require_relative '.ruby_repl_ext'

Pry.editor = 'vim'
Pry.config.color = true

# Show rails environment and project name
Pry.config.prompt = PryRails::RAILS_PROMPT if defined?(PryRails::RAILS_PROMPT)

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'

# Use awesome print automatically when inspecting stuff
AwesomePrint.pry! if defined?(AwesomePrint)
