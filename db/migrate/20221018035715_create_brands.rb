class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
