gem_group :development do
  gem 'pry-rails'
  gem 'guard-rspec', require: false
  gem 'rspec-rails'
  gem 'annotate'
end

gem_group :test do
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails', '~> 4.0'
  gem 'capybara'
end

# Use sass on application.css
run "mv app/assets/stylesheets/application.css app/assets/stylesheets/application.css.scss"

# Ignore database.yml
run "cat << EOF >> .gitignore
/config/database.yml
EOF"

after_bundle do
  # stop spring to avoid problems with generators
  run 'spring stop'

  # Setup guard
  run 'bundle exec guard init rspec'

  # Setup rspec
  run 'bundle exec rails g rspec:install'

  # Include capybara and shoulda-matchers on rspec config
  inject_into_file 'spec/rails_helper.rb', after: "require 'rspec/rails'\n" do
<<-EOF
require 'capybara/rspec'
require 'capybara/rails'
require 'shoulda/matchers'
EOF
  end

  # Don't use rails fixtures
  gsub_file(
    'spec/rails_helper.rb',
    'config.fixture_path = "#{::Rails.root}/spec/fixtures"',
    '# config.fixture_path = "#{::Rails.root}/spec/fixtures"',
  )

  # Don't infer spec types
  gsub_file(
    'spec/rails_helper.rb',
    'config.infer_spec_type_from_file_location!',
    '# config.infer_spec_type_from_file_location!',
  )

  # Add ControllerMacros
  run "mkdir spec/support && cat <<-EOF >> spec/support/factory_macros.rb
module FactoryMacros
  def attributes_with_foreign_keys(*args)
    ·FactoryGirl.build(*args).attributes.delete_if do |k, v|
    · · %w(id type created_at updated_at).member? k
   ·  end
    end
  end
end"

  # Include ControllerMacros and FactoryGirl syntax methods on rspec config
  inject_into_file('spec/rails_helper.rb', after: "RSpec.configure do |config|\n") do
<<-EOF
  config.include FactoryMacros
  config.include FactoryGirl::Syntax::Methods # to avoid writting FactoryGirl::

EOF
  end
end
