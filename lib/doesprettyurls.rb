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
        cattr_accessor :pretty_param_attribute
        cattr_accessor :pretty_param_proc
        cattr_accessor :pretty_param_reverse_proc

        # Typical use case is to send a column/attribute name:
        @@pretty_param_attribute = opts[:attribute] || :name

        # A Proc may also be sent for realtime URL beautification:
        if opts[:proc]
          @@pretty_param_proc = opts[:proc]
        end
        
      end
    end
    
    # Provide a mechanism to automagically "slugify" URL parameters
    def to_param
      slug_source = if pretty_param_proc
        pretty_param_proc.call(self)
      else
        self.send(pretty_param_attribute)
      end
      "#{id}-#{slug_source.downcase.gsub("'", "").gsub(/[^a-z1-9]+/i, "-")}"
    end
    
    # We need to help ActiveRecord go back the other way:
    def self.from_param(param)
      find(param.to_i)
    end
    
    
  end # ActiveRecord::Base
end # ActiveRecord
