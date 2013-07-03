require 'mongoid'

class Document
  include Mongoid::Document
  include Tenacity

  field :file_name, type: String
end
