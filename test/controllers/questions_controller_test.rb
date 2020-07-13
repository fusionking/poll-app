require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first = polls(:first)
  end

  test "should get new multiple choice question form" do
    get new_poll_question_path(@first, question: { 
    	submittable_type: 'MultipleChoiceSubmittable' }
    )
    assert_response :success
    assert_equal "new", @controller.action_name
    assert_select "h1", "Add Question"
    assert_select "h4", "Add Multiple Choice Options"
  end

  test "should get new open ended question form" do
    get new_poll_question_path(@first, question: { 
    	submittable_type: 'OpenSubmittable' }
    )
    assert_response :success
    assert_equal "new", @controller.action_name
    assert_select "h1", "Add Question"
  end

  test "should create open ended Question" do
  	assert_difference('Question.count') do
    	post poll_questions_path(@first, question: { 
    		title: 'I am a new question!',
    		submittable_type: 'OpenSubmittable' }
    	)
  	end
 
  	assert_redirected_to poll_path(@first)
  	assert_equal 'I am a new question!', @first.questions.last.title
   end

   test "should create multiple choice Question" do
  	  assert_difference('Question.count') do
    	 post poll_questions_path(@first, question: { 
    		  title: 'I am a new question!',
    		  submittable_type: 'MultipleChoiceSubmittable',
    		  submittable_attributes: { 
    			 options_attributes: {"0"=>{"text"=>"1"}, "1"=>{"text"=>"2"}, "2"=>{"text"=>"3 or more"}}} 
    		  }
    	)
  	  end
 
  	assert_redirected_to poll_path(@first)
  	assert_equal 'I am a new question!', @first.questions.last.title
  	assert_equal '1', @first.questions.last.submittable.options.first.text
   end

   test "should not create open ended Question without a title" do
    assert_no_difference('Question.count') do
      post poll_questions_path(@first, question: { 
        submittable_type: 'OpenSubmittable' }
      )
    end
    assert_template :new

   end
end
