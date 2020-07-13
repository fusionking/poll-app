##
# Represents a single Option instance.
# Cannot save an instance without a `question`.
# This model is used to represent a multiple choice option.
# Has a text attribute which represents the option's textual value.
#
# === Examples
# =>    Option.new(question: question, text: 'Abc')
# =>    Option.where(question: question)
# 

class Option < ApplicationRecord
  belongs_to :question
end
