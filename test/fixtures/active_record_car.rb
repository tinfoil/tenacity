class ActiveRecordCar < ActiveRecord::Base
  include Tenacity

  t_has_one :active_record_engine, :foreign_key => 'car_id', :dependent => :nullify
end
