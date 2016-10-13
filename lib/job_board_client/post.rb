class Post < Model
  attribute :id, Integer
  attribute :title, String
  attribute :location, String
  attribute :description, String
  attribute :status, String
  attribute :created_at, DateTime
  attribute :published_at, DateTime
  attribute :expired_at, DateTime
  attribute :active, Boolean

  def self.all
    request(resource).get_all
  end

  def self.find_by_id(id)
    request(resource).get_by_id(id)
  end

  def self.resource
    "http://some-endpoint.io"
  end
end
