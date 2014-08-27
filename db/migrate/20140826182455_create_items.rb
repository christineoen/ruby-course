class CreateItems < ActiveRecord::Migration
  def change
    # TODO
    create_table :items do |t|
      t.string :name
      t.integer :price
    end
  end
end
