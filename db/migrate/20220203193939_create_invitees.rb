class CreateInvitees < ActiveRecord::Migration[5.2]
  def change
    create_table :invitees do |t|
      t.references :user, foreign_key: true
      t.references :party, foreign_key: { to_table: :viewing_parties }
      t.boolean :host
      t.timestamps
    end
  end
end
