class CreateAnexos < ActiveRecord::Migration
  def change
    create_table :anexos do |t|
      t.string :data
      t.references :anexo, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
