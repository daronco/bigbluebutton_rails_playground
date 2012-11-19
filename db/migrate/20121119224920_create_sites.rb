class CreateSites < ActiveRecord::Migration
  def up
    create_table :sites do |t|
      t.string   :name,          :null => false
      t.text     :description
      t.text     :signature
      t.string   :domain
      t.string   :locale
      t.string   :feedback_url
      t.string   :analytics_code
      t.boolean  :current,       :default => false
      # t.boolean  :ssl,         :default => false

      t.boolean  :exception_notifications,        :default => false
      t.string   :exception_notifications_email
      t.string   :exception_notifications_prefix

      t.boolean  :shib_enabled,     :default => false
      t.string   :shib_name_field
      t.string   :shib_email_field

      t.string   :smtp_login
      t.string   :smtp_password
      t.boolean  :smtp_auto_tls
      t.string   :smtp_server
      t.integer  :smtp_port
      t.boolean  :smtp_use_tls
      t.string   :smtp_domain
      t.string   :smtp_auth_type
      t.string   :smtp_sender

      t.boolean  :chat_enabled,                   :default => false
      t.string   :xmpp_server

      t.timestamps
    end
  end

  def down
    drop_table :sites
  end
end
