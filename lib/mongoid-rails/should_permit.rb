
module MongoidRails
  # Ensure that the criteria are permitted.
  #
  # @example Ignoring ActionController::Parameters
  #   should_permit?({_id: ActionController::Parameters.new("$size" => 1)})
  #
  # @api private
  #
  # @param [ Object ] criteria
  # @return [ Boolean ] if should permit
  def self.should_permit?(criteria)
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
