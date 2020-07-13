##
# Represents a single MultipleChoiceSubmittable instance.
# Cannot save an instance without a `question`.
# This model is used as a polymorphic model, which holds question options.
#
# === Examples
# =>    MultipleChoiceSubmittable.new(question: question)
# =>    MultipleChoiceSubmittable.where(question: question)
# 

class MultipleChoiceSubmittable < ApplicationRecord
  has_many :options, foreign_key: :question_id
  has_one :question, as: :submittable

  accepts_nested_attributes_for :options, reject_if: :all_blank

  # Returns an Array of multiple choice Option instances to be
  # rendered in the form.
  # If the instance already has existing Options, returns them instead.
  def options_for_form
    if options.any?
      options
    else
      [Option.new, Option.new, Option.new]
    end
  end

  # Gets all Response instances of the associated Question,
  # orders them by their textual value and counts each text group
  # to calculate the percentage of selection.
  # Returns percentages followed by response text.
  # 
  # ---
  #
  # submittable.breakdown # => '50% No, %50 Yes'
  def breakdown
    total = responses.count
    counts = responses.group(:text).order('COUNT(*) DESC').count
    percents = counts.map do |text, count|
      percent = (100.0 * count / total).round
      "#{percent}% #{text}"
    end
    percents.join(', ')
  end

  # Returns all Response instances of an associated Question.
  def responses
    question.responses
  end

  # Returns all associated Option instances.
  def options
    Option.where(question: self.question)
  end

end
