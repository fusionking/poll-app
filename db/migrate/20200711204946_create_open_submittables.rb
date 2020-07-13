class CreateOpenSubmittables < ActiveRecord::Migration[6.0]
  def change
    create_table :open_submittables do |t|

      t.timestamps
    end
  end
end
