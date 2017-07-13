class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :users, index: true, foreign_key: true
      t.references :categories, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
