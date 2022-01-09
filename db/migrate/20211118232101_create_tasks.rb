class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :parent, foreign_key: { to_table: :tasks, on_delete: :cascade}
      t.string :name
      t.integer :position
      t.integer :urgency
      t.integer :success
      t.integer :failure
      t.string :webLink

      t.timestamps
    end
  end
end
