class Plants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :photo_url
      t.string :properties

      t.timestamps
    end
  end
end
