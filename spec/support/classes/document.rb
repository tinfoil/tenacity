class Document
  include Mongoid::Document
  include Tenacity

  field :file_name, type: String
  field :firm_id, type: Integer
end
