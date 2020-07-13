class OpenSubmittable < ApplicationRecord
  has_one :question, as: :submittable

  def breakdown
    text_from_ordered_answers = responses.order(:created_at).pluck(:text)
    text_from_ordered_answers.join(', ')
  end

  def responses
    question.responses
  end
end
