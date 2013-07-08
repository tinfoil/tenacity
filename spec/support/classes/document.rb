class Document
  include Mongoid::Document
  include Tenacity

  field :file_name, type: String
  field :firm_id, type: Integer

  t_has_many :comments, as: :commentable, dependent: :destroy, polymorphic: true
  alias :comments :commentable
end
