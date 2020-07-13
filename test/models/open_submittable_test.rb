require 'test_helper'

class OpenSubmittableTest < ActiveSupport::TestCase
  test "should have the correct response count" do
  	one = open_submittables(:one)
  	assert_equal 1, one.responses.size
  end

  test "should not have options" do
  	one = open_submittables(:one)
  	assert_raises(NoMethodError) do
  		one.options
  	end
  end
end
