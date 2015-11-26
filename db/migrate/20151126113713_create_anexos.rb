class CreateAnexos < ActiveRecord::Migration
  def change
    create_table :anexos do |t|
      t.string :file
      t.references :anexavel, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
