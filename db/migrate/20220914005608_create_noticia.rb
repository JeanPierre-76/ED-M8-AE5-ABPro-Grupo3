class CreateNoticia < ActiveRecord::Migration[7.0]
  def change
    create_table :noticia do |t|
      t.text :encabezado
      t.text :cuerpo
      t.text :link
      t.integer :tipo

      t.timestamps
    end
  end
end
