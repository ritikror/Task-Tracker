class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :time
      t.integer :assign_to
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
