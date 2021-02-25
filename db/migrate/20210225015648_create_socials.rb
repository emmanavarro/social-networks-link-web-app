class CreateSocials < ActiveRecord::Migration[6.1]
  def change
    create_table :socials do |t|
      t.references :user, null: false, foreign_key: true
      t.string :social_network_name
      t.string :profile_link

      t.timestamps
    end
  end
end
