class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :status, default: false
      t.boolean :visibility

      t.timestamps
    end
  end
end
