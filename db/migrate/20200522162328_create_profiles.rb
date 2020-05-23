class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :cover_photo_url
      t.string :profile_picture_url

      t.timestamps
    end
  end
end
