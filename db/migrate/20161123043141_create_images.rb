class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image_src
      t.integer :product_id

      t.timestamps
    end
  end
end
