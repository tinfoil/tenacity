require 'rubygems'
require 'bundler'
require 'debugger'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'test/unit'
require 'shoulda'
require 'mocha'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'tenacity'

require File.join(File.dirname(__FILE__), 'helpers', 'active_record_test_helper')
require File.join(File.dirname(__FILE__), 'helpers', 'mongoid_test_helper')

Dir[File.join(File.dirname(__FILE__), 'fixtures', '*.rb')].each { |file| autoload(file[file.rindex('/') + 1..-4].camelcase, file) }

def setup_fixtures
  Dir.glob(File.join(File.dirname(__FILE__), 'fixtures', '*.rb')).each do |filename|
    begin
      filename =~ /.*\/(.*)\.rb/
      clazz = Kernel.const_get($1.camelcase)
      if clazz.respond_to?(:delete_all)
        clazz.delete_all rescue true
      elsif clazz.respond_to?(:db)
        clazz.db["delete from #{clazz.table_name}"].delete
      elsif clazz.respond_to?(:destroy!)
        clazz.destroy!
      else
        puts "WARNING: Don't know how to clear fixtures for #{clazz}"
      end
    rescue NameError
    end
  end
end

def setup_fixtures_for(source, target)
  setup_fixtures
end

def orm_extensions
  if ENV['QUICK'] == 'true'
    extensions = [:active_record]
  else
    extensions = [:active_record]
    require_mongoid { extensions << :mongoid }
    extensions
  end
end

def for_each_orm_extension_combination
  orm_extensions.each do |source|
    orm_extensions.each do |target|
      yield source, target
    end
  end
end

def class_for_extension(extension, type=nil)
  if type.nil?
    class_name = extension.to_s.camelcase + 'Object'
  elsif type == :t_belongs_to || type == :t_has_one
    class_name = extension.to_s.camelcase + 'HasOneTarget'
  elsif type == :t_has_many
    class_name = extension.to_s.camelcase + 'HasManyTarget'
  end
  Kernel.const_get(class_name)
end

def foreign_key_for(extension, type)
  if type == :t_belongs_to
    "#{extension}_object"
  elsif type == :t_has_one
    "#{extension}_has_one_target"
  elsif type == :t_has_many
    "#{extension}_has_many_targets"
  end
end

def foreign_key_id_for(extension, type)
  if type == :t_belongs_to
    "#{extension}_object_id"
  elsif type == :t_has_one
    "#{extension}_has_one_target_id"
  elsif type == :t_has_many
    "#{extension}_has_many_target_ids"
  end
end

def assert_set_equal(expecteds, actuals, message = nil)
  expecteds = expecteds.map { |x| to_comparison_format(x) } if expecteds
  actuals = actuals.map { |x| to_comparison_format(x) } if actuals

  assert ((expecteds && Set.new(expecteds)) == (actuals && Set.new(actuals))) || (expecteds == actuals),
         "#{expecteds.inspect} expected but was #{actuals.inspect}"
end

def to_comparison_format(object)
  object
end

def serialize_id(object)
  object.class._t_serialize(object.id)
end