class Firm < ActiveRecord::Base
  include Tenacity

  t_has_many :employees
  t_has_many :documents

  t_has_many :comments, as: :commentable, dependent: :destroy, polymorphic: true
end