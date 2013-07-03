class Firm < ActiveRecord::Base
  include Tenacity

  t_has_many :employees
  t_has_many :documents
end