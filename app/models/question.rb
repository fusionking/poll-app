##
# Represents a single Question instance.
# Cannot save an instance without a `title`, `submittable`, 
# `submittable_type` and `poll`.
# 
# `submittable` is an associated ForeignKey, which decides which
#  type of a Question this instance is. 
#  
# `submittable_type` holds the question type 
#  (either OpenSubmittable or MultipleChoiceSubmittable) 
#  This attribute decides how the Question form is rendered.
#
# === Examples
# =>    Question.new(title: 'New Question', submittable: MultipleChoiceSubmittable,
#                    poll: Poll, submittable_type: 'MultipleChoiceSubmittable')
# =>    Question.where(title: 'Abc')
# 

class Question < ApplicationRecord
  include ActiveModel::ForbiddenAttributesProtection
  
  QUESTION_TYPES = %w(
    OpenSubmittable
    MultipleChoiceSubmittable
  ).freeze

  validates :submittable, associated: true
  validates :submittable_type, presence: true, inclusion: QUESTION_TYPES
  validates :title, presence: true

  belongs_to :poll
  belongs_to :submittable, polymorphic: true
  has_many :responses

  accepts_nested_attributes_for :submittable

  # Builds a new associated instance of a Submittable class at run time,
  # based on the type value, which is coming from the request.
  def build_submittable(type)
    submittable_class = type.constantize
    self.submittable = submittable_class.new(question: self)
  end

  # Builds associated Option instances based on attributes coming from the form.
  def build_options(attributes)
    attributes.each do |key, value|
      @option = Option.new(text: value[:text])
      @option.question = self
      @option.save
    end
  end
end
