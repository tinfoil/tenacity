class Document
  include Mongoid::Document
  include Tenacity

  field :file_name, type: String
  field :firm_id, type: Integer

  #t_belongs_to :firm, class_name: Firm, foreign_key: :firm_id
end
