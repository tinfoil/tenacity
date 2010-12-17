module Tenacity
  module InstanceMethods

    private

    def get_association(association_id, params)
      _t_reload
      force_reload = params.first unless params.empty?
      value = instance_variable_get ivar_name(association_id)
      if value.nil? || force_reload
        value = yield
        instance_variable_set ivar_name(association_id), value
      end
      value
    end

    def set_association(association_id, associate)
      yield
      instance_variable_set ivar_name(association_id), associate
    end

    def ivar_name(association_id)
      "@_t_" + association_id.to_s
    end

  end
end