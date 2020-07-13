require 'test_helper'

class PollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first = polls(:first)
  end

  test "should get index" do
    get polls_url
    assert_response :success
    assert_equal "index", @controller.action_name
    assert_match "All Polls", @response.body
  end

  test "should create Poll" do
  	assert_difference('Poll.count') do
    	post polls_url, params: { poll: { title: 'I am a new poll!' } }
  	end
 
  	assert_redirected_to poll_path(Poll.last)
   end

  test "should show Poll" do
  	get poll_url(@first)
  	assert_response :success
  	assert_match @first.title, @response.body
  end

  test "should show new Poll form" do
  	get new_poll_url
  	assert_response :success
  	assert_match 'Create Poll', @response.body
  end

  test "should not create a Poll without a title" do
    assert_no_difference('Poll.count') do
      post polls_url, params: { poll: { some_other_key: 'I am a new poll!' } }
    end
    assert_template :new

   end
end
