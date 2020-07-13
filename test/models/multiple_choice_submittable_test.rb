require 'test_helper'

class MultipleChoiceSubmittableTest < ActiveSupport::TestCase
  setup do
    @one = multiple_choice_submittables(:one)
  end

  test "should have the correct option count" do
  	assert_equal 3, @one.options.size
  end

  test "should have the correct response count" do
  	assert_equal 2, @one.responses.size
  end

  test "breakdown should be correct" do
  	assert @one.breakdown.include? "50% First Choice"
  	assert @one.breakdown.include? "50% Second Choice"
  end

  test "should return correct options" do
    assert_equal 3, @one.options_for_form.size
  end
end
