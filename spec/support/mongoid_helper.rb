def require_mongoid
  begin
    require 'mongoid'
    yield
  rescue LoadError
  end
end

begin
  require 'mongoid'
  Mongoid.load!(File.join(Tenacity.root, '/config/mongoid.yml'), :test)
rescue LoadError
  puts 'WARNING:  Mongoid could not be loaded.  Skipping tests.'
end