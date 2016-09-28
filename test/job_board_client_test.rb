require 'test_helper'

class JobBoardClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::JobBoardClient::VERSION
  end
end
