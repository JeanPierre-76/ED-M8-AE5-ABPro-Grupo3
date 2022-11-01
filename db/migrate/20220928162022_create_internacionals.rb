class CreateInternacionals < ActiveRecord::Migration[7.0]
  def change
    create_table :internacionals do |t|
      t.string :encabezado
      t.text :cuepor
      t.string :link

      t.timestamps
    end
  end
end
