class CreateShareTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :share_tokens do |t|
      t.references :user, foreign_key: true
      t.string :token
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
