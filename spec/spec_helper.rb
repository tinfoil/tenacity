require 'tenacity' # and any other gems you need
require 'mongoid'
require 'factory_girl'
require 'active_record'
require 'database_cleaner'

Dir[File.join(Tenacity.root, 'spec/support/**/*.rb')].each { |f| require f }
Dir[File.join(Tenacity.root, 'spec/factories/**/*.rb')].each { |f| require f }
Dir[File.join(Tenacity.root, 'spec/classes', '*.rb')].each { |file| autoload(file[file.rindex('/') + 1..-4].camelcase, file) }

RSpec.configure do |config|

  config.before(:each) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:mongoid, {connection: Mongoid.sessions['default']['database'].to_sym}].strategy = :truncation
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # FactoryGirl
  config.include FactoryGirl::Syntax::Methods

end