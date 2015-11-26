class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
