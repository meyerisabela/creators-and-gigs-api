class CreateGigPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :gig_payments do |t|
      t.string :state, default: 'pending'
      t.references :gig, null: false, foreign_key: true

      t.timestamps
    end
  end
end
