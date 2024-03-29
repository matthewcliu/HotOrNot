class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :comment
      t.string :name
      t.string :content_type
      t.binary :data, :limit => 5.megabyte

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
