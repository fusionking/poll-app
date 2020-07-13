class MultipleChoiceSubmittable < ApplicationRecord
  has_many :options, foreign_key: :question_id
  has_one :question, as: :submittable

  accepts_nested_attributes_for :options, reject_if: :all_blank

  def options_for_form
    if options.any?
      options
    else
      [Option.new, Option.new, Option.new]
    end
  end

  def breakdown
    total = responses.count
    counts = responses.group(:text).order('COUNT(*) DESC').count
    percents = counts.map do |text, count|
      percent = (100.0 * count / total).round
      "#{percent}% #{text}"
    end
    percents.join(', ')
  end

  def responses
    question.responses
  end

  def options
    Option.where(question: self.question)
  end

end
