class CreatePageData < ActiveRecord::Migration[5.0]
  def change
    create_table :page_data do |t|
      t.belongs_to :page, foreign_key: true
      t.string :title
      t.string :price_gross
      t.string :price_vat
      t.string :price_net

      t.timestamps
    end
  end
end
