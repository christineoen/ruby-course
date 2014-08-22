class CreateHonks < ActiveRecord::Migration
  def change
    # TODO
    create_table :honks do |h|
      h.integer :user_id
      h.string :content
    end

  end
end
