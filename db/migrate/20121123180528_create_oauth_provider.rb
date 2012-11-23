class CreateOauthProvider < ActiveRecord::Migration
  def up
    create_table :oauth_access_grants do |t|
      t.string :code
      t.string :access_token
      t.string :refresh_token
      t.datetime :access_token_expires_at
      t.integer :user_id
      t.integer :oauth_app_id
      t.string :state
      t.timestamps
    end
    create_table :oauth_apps do |t|
      t.string :name
      t.string :app_id
      t.string :app_secret
      t.timestamps
    end
  end

  def down
    drop_table :oauth_access_grants
    drop_table :oauth_apps
  end
end
