class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students, primary_key: :student_number, autoincrement: false do |t|
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
