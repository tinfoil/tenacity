require_mongoid do
  class MongoidObject
    include Mongoid::Document
    include Tenacity

    field :prop, :type => String

    t_has_one :active_record_has_one_target
    require_mongoid { t_has_one :mongoid_has_one_target }

    t_has_many :active_record_has_many_targets
    require_mongoid { t_has_many :mongoid_has_many_targets }

    t_has_one :active_record_has_one_target, :as => :active_record_has_one_target_testable
    require_mongoid { t_has_one :mongoid_has_one_target, :as => :mongoid_has_one_target_testable }

    t_has_many :active_record_has_many_targets, :as => :active_record_has_many_target_testable
    require_mongoid { t_has_many :mongoid_has_many_targets, :as => :mongoid_has_many_target_testable }
  end
end
