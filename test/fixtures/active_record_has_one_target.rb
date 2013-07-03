class ActiveRecordHasOneTarget < ActiveRecord::Base
  include Tenacity

  t_belongs_to :active_record_object
  require_mongoid { t_belongs_to :mongoid_object }

  t_belongs_to :active_record_has_one_target_testable, :polymorphic => true
  require_mongoid { t_belongs_to :mongoid_has_one_target_testable, :polymorphic => true }
end
