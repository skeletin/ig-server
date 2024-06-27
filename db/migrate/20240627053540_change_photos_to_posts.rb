class ChangePhotosToPosts < ActiveRecord::Migration[7.1]
  def change
    rename_table :photos, :posts
  end
end
