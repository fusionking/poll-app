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

  def build_submittable(type, attributes)
    submittable_class = type.sub('Question', 'Submittable').constantize
    self.submittable = submittable_class.new(question: self)
  end

  def build_options(attributes)
    attributes.each do |key, value|
      @option = Option.new(text: value[:text])
      @option.question = self
      @option.save
    end
  end
end
