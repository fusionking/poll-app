##
# Represents a single Poll instance.
# Cannot save an instance without a `title`.
#
# === Examples
# =>  	Poll.new(title: 'New title')
# =>    Poll.first.questions.all [<Question>, <Question>...]
#   

class Poll < ApplicationRecord
  validates :title, presence: true
  has_many :questions
  accepts_nested_attributes_for :questions
end
