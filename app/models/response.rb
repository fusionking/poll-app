##
# Represents a single Response instance.
# Cannot save an instance without a `question`
# This model represents a completed response to a Poll, by a specific user
#
# === Examples
# =>    Poll.new(question: question)
# =>    Question.where(question: question)
#

class Response < ApplicationRecord
  belongs_to :question
end
