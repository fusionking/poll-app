require 'test_helper'

class PollFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h3", "All Polls"
  end
end
