require 'test_helper'

class PollTest < ActiveSupport::TestCase
  	test "should not save a poll without a title" do
  		poll = Poll.new
  		assert_not poll.save, "Saved the poll without a title"
	end

	test "should save a poll with a title" do
		poll = Poll.new(title: 'New Title')
		assert poll.save, "Could not save the poll with a title"
	end

	test "should have correct question size" do
		poll = polls(:first)
		assert_equal 2, poll.questions.size
	end
end
