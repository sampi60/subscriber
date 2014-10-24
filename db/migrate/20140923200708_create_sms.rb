class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :name
      t.string :uri
      t.string :last_status
      t.datetime :last_status_date
      t.string :last_post

      t.timestamps
    end
  end
end
