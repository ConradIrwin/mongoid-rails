require 'mongoid'
require 'mongoid-rails/should_permit'
require 'mongoid-rails/forbidden_attributes_protection'
require 'mongoid-rails/forbidden_query_protection'

# From https://github.com/rails/strong_parameters/issues/32
Mongoid::Document.send(:include, MongoidRails::ForbiddenAttributesProtection)

# From https://github.com/mongoid/mongoid/commit/f02144f3af7f798187ec2133dfb615c973334ffe
Mongoid::Criteria.send(:include, MongoidRails::ForbiddenQueryProtection)
