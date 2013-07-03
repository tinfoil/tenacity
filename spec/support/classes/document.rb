class Document
  include Mongoid::Document
  include Tenacity

  field :file_name, type: String
  field :firm_id, type: String

  #t_belongs_to :firm
end
