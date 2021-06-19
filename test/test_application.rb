require_relative 'test_helper'

class TestApp < Speses::Application

end


class SpesesAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end


  def test_request
    get "/"

    assert last_response.ok?
    body = last_response.body
    assert body["hello"]
  end
end
