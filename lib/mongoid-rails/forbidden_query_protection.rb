module MongoidRails
  module ForbiddenQueryProtection
    # Redefine all query methods to be safe against hash injection attacks.
    Origin::Selectable.instance_methods(false).each do |method|
      define_method method do |*criteria|
        raise ActiveModel::ForbiddenAttributes.new(klass, method, criteria) unless should_permit?(criteria)
        super(*criteria)
      end
    end

    private

    # Ensure that the criteria are permitted.
    #
    # @example Ignoring ActionController::Parameters
    #   should_permit?({_id: ActionController::Parameters.new("$size" => 1)})
    #
    # @api private
    #
    # @param [ Object ] criteria
    # @return [ Boolean ] if should permit
    def should_permit?(criteria)
      if criteria.respond_to?(:permitted?)
        return criteria.permitted?
      elsif Hash === criteria || Array === criteria
        criteria.each do |criterion|
          return false unless should_permit?(criterion)
        end
      end

      true
    end
  end
end
