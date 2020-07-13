##
# Represents a single OpenSubmittable instance.
# Cannot save an instance without a `question`.
# This model is used as a polymorphic model, which holds the open ended Question.
#
# === Examples
# =>    OpenSubmittable.new(question: question)
# =>    OpenSubmittable.where(question: question)
# 

class OpenSubmittable < ApplicationRecord
  has_one :question, as: :submittable

  # Gets all Response instances of the associated Question,
  # orders them by their creation time and returns their textual values.
  # 
  # ---
  #
  # submittable.breakdown # => 'No, Yes, Prefer Not To Answer'
  def breakdown
    text_from_ordered_answers = responses.order(:created_at).pluck(:text)
    text_from_ordered_answers.join(', ')
  end

  # Returns all Response instances of an associated Question.
  def responses
    question.responses
  end
end
