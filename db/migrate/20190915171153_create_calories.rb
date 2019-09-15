class CreateCalories < ActiveRecord::Migration[5.2]
  def change
    create_table :calories do |t|
      t.decimal :value
      t.string :type_value
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
