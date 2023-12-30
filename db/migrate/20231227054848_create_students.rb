class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students, id: false do |t|
      t.integer :student_number, null: false, primary_key: true
      t.string :name
      t.string :class_type
      t.string :group
      t.string :admission_date
      t.integer :grade
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
