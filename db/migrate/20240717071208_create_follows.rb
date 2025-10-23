class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows, id: :uuid do |t|
      t.uuid :follower_id
      t.uuid :followed_user_id

      t.timestamps
    end
  end
end
