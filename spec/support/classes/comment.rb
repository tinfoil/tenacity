class Comment < ActiveRecord::Base
  include Tenacity

  t_belongs_to :commentable, polymorphic: true
end