require_relative 'test_helper'

class TestController < Test::Unit::TestCase
  def index
    "Hello"
  end
end
class TestApp < Speses::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end


class SpesesAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end


  def test_request
    get "/quotes/a_quote"

    assert last_response.ok?
    body = last_response.body
    assert body["There"]
  end
end
