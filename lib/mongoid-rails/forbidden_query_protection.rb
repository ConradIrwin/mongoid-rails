module MongoidRails
  module ForbiddenQueryProtection
    if Gem::Version.new(Mongoid::VERSION) >= Gem::Version.new('6.0.0.beta')
      selectable = ::Mongoid::Criteria::Queryable::Selectable
    else
      selectable = Origin
    end
    # Redefine all query methods to be safe against hash injection attacks.
    selectable.instance_methods(false).each do |method|
      define_method method do |*criteria|
        raise ActiveModel::ForbiddenAttributesError unless MongoidRails.should_permit?(criteria)
        super(*criteria)
      end
    end
  end
end
