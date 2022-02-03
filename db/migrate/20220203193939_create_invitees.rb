class CreateInvitees < ActiveRecord::Migration[5.2]
  def change
    create_table :invitees do |t|
      t.references :user_id, foreign_key: true
      t.references :party_id, foreign_key: { to_table: :viewing_party }
      t.boolean :host
      t.timestamps
    end
  end
end
