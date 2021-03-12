class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :brand_name
      t.string :state, default: 'applied'
      t.references :creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
