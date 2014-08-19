module MongoidRails
  module ForbiddenQueryProtection
    # Redefine all query methods to be safe against hash injection attacks.
    Origin::Selectable.instance_methods(false).each do |method|
      define_method method do |*criteria|
        raise ActiveModel::ForbiddenAttributesError unless MongoidRails.should_permit?(criteria)
        super(*criteria)
      end
    end
  end
end
