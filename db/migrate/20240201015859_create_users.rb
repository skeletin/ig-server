class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, index: { unique: true, name: "unique_emails" }
      t.string :username, null: false, index: { unique: true, name: "unique_usernames" }
      t.string :password_digest, null: false
      t.string :full_name, null: false
      t.date :birth_date, null: false
      t.timestamps
    end
  end
end
