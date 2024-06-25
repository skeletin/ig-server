class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.text :caption

      t.timestamps
    end
  end
end
