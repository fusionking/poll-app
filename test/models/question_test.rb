require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @first = questions(:first)
  end

  test "should not save a Question without a title" do
  	  question = Question.new
  	  assert_not question.save, "Saved the question without a title"
  end

  test "should raise an error if a wrong submittable type is provided" do
  	 question = Question.new(title: 'Title')
  	 assert_raises(NameError) do
  	 	question.build_submittable('NonExistentClass')
  	 end
  end

  test "should not save a Question without a poll" do
  	question = Question.new(title: 'Title', submittable_type: 'MultipleChoiceSubmittable')
  	question.build_submittable('MultipleChoiceSubmittable')
  	assert_not question.save, "Saved the question without a poll"
  end

  test "should save a Question with full fields" do
  	poll = Poll.create(title: 'New Poll')
  	question = Question.new(title: 'Title', submittable_type: 'MultipleChoiceSubmittable')
  	question.build_submittable('MultipleChoiceSubmittable')
  	question.poll = poll
  	assert question.save, "Saved the question without a poll"
  end

  test "should have the correct option count" do
  	assert_equal 3, @first.submittable.options.size
  end

  test "should not have null responses" do
  	assert_not_nil @first.responses
  	assert_equal 2, @first.responses.size
  end

  test "should not create new options with empty attributes" do
    @first.build_options({})
    assert_equal 3, @first.submittable.options.size
  end

end
