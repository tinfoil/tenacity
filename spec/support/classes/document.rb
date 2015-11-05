require File.join(Tenacity.root, 'spec/support/classes/firm.rb')

class Document
  include Mongoid::Document
  include Tenacity

  field :file_name, type: String
  field :firm_id, type: Integer

  t_has_many :comments, as: :commentable, dependent: :destroy, polymorphic: true

  t_belongs_to :firm, foreign_key: :firm_id
end
