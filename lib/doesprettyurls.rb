# AWEXOME LABS
# DoesPrettyUrls

require 'doesprettyurls'
require 'rails'
require 'active_record'


module DoesPrettyUrls

  # Create a Rails Engine
  class Engine < Rails::Engine
  end
  
  # Return the current working version from VERSION file:
  def self.version
    @@version ||= File.open(File.join(File.dirname(__FILE__), "..", "VERSION"), "r").read
  end
  
end # DoesPrettyUrls


module ActiveRecord
  class Base
    
    # Call this method within your class to get fancy URLs
    def self.doesprettyurls(opts={})
      self.instance_eval do
        @@pretty_param_method = opts[:attribute] || :name
        cattr_accessor :pretty_param_method
      end
    end
    
    # Provide a mechanism to automagically "slugify" URL parameters
    def to_param
      "#{id}-#{(send pretty_param_method).downcase.gsub("'", "").gsub(/[^a-z1-9]+/i, "-")}"
    end
    
  end # ActiveRecord::Base
end # ActiveRecord
