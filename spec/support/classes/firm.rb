class Firm < ActiveRecord::Base
  include Tenacity

  t_has_many :employees
end