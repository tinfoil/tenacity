class ActiveRecordObjectWithStringId < ActiveRecord::Base
  include Tenacity

  self.primary_key = 'id'
end
