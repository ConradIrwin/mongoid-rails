require 'mongoid'
require 'strong_parameters'
require 'mongoid-rails/forbidden_query_protection'

# From https://github.com/rails/strong_parameters/issues/32
Mongoid::Document.send(:include, ActiveModel::ForbiddenAttributesProtection)

# From https://github.com/mongoid/mongoid/commit/f02144f3af7f798187ec2133dfb615c973334ffe
Mongoid::Criteria.send(:include, MongoidRails::ForbiddenQueryProtection)
