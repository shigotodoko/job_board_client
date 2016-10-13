require 'http_monkey'
require 'json'

class Request
  attr_accessor :resource
  attr_accessor :klass

  def get_all
    entries = parse_response

    entries.map { |entry| klass.new(entry) }
  end

  def get_by_id(id)
    build_resource_with_id!(id)

    entry = parse_response

    klass.new(entry)
  end

  private

  def response
    get_resource
  end

  def parse_response
    JSON.parse(response.body)
  end

  def agent
    @agent ||= ::HttpMonkey.build
  end

  def get_resource
    agent.at(resource).yield_request do |request|
      request.auth.ssl.verify_mode = :none
    end.get
  end

  def build_resource_with_id!(id)
    @resource = "#{resource}/#{id}"
  end
end
