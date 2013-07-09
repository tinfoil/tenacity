class Employee < ActiveRecord::Base
  include Tenacity

  t_belongs_to :firm
end