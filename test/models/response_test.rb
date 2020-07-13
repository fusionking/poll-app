require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  test "should not save a Response without a question" do
  	response = Response.new
  	assert_not response.save, "Saved the Response without a question"
  end

  test "should save a Response with a question" do
  	question = questions(:first)
  	response = Response.new(question: question)
  	assert response.save, "Could not save the response with a question"
  end
end
