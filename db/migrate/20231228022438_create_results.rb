class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :student, null: false
      t.float :personality
      t.float :self_image
      t.float :communication
      t.float :thinking_ability
      t.float :basic_score
      t.integer :times
      t.integer :class_rank
      t.integer :grade_rank
      t.integer :weekly_achievement
      t.integer :monthly_achievement
      t.float :mvp_percentage
      t.timestamps
    end
  end
end
