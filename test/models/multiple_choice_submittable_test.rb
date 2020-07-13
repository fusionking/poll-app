require 'test_helper'

class MultipleChoiceSubmittableTest < ActiveSupport::TestCase
  test "should have the correct option count" do
  	one = multiple_choice_submittables(:one)
  	assert_equal 3, one.options.size
  end

  test "should have the correct response count" do
  	one = multiple_choice_submittables(:one)
  	assert_equal 2, one.responses.size
  end

  test "breakdown should be correct" do
  	one = multiple_choice_submittables(:one)
  	assert one.breakdown.include? "50% First Choice"
  	assert one.breakdown.include? "50% Second Choice"
  end
end
