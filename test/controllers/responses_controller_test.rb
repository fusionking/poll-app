require 'test_helper'

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first = polls(:first)
  end
  
  test "should get new poll form" do
    get new_poll_response_path(@first)
    assert_response :success
    assert_equal "new", @controller.action_name
    assert_select "h2", @first.title
    assert_select "input", { :count=>4 }, "Wrong number of option elements"
    assert_select "p[class=question-title]", { :count=>2 }, "Wrong number of question title elements"
  end

  test "should create a new response" do
  	questions = @first.questions
  	params = questions.map{|question| ["question_#{question.id}", (question.submittable.options.last.text if question.submittable_type == 'MultipleChoiceSubmittable') ] }.to_h  	
  	assert_difference('Response.count') do
    	post poll_responses_path(@first, params)
    end
    assert_equal 4, Response.count
    assert_equal "create", @controller.action_name
    assert_redirected_to poll_path(@first)
  end
end
