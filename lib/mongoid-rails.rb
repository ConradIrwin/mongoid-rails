require 'mongoid'
require 'strong_parameters'
require 'mongoid-rails/forbidden_query_protection'

Mongoid::Document.send(:include, ActiveModel::ForbiddenAttributesProtection)
Mongoid::Criteria.send(:include, MongoidRails::ForbiddenQueryProtection)
