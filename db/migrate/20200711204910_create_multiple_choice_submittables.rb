class CreateMultipleChoiceSubmittables < ActiveRecord::Migration[6.0]
  def change
    create_table :multiple_choice_submittables do |t|

      t.timestamps
    end
  end
end
