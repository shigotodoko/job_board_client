require 'virtus'

class Model
  include Virtus.model

  def self.request(resource)
    Request.new.tap do |request|
      request.resource = resource
      request.klass = self
    end
  end
end
