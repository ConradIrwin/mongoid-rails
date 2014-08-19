module MongoidRails
  module ForbiddenAttributesProtection

    def sanitize_for_mass_assignment(attributes)
      if MongoidRails.should_permit?(attributes)
        attributes
      else
        raise ActiveModel::ForbiddenAttributesError
      end
    end
    alias :sanitize_forbidden_attributes :sanitize_for_mass_assignment
  end
end
