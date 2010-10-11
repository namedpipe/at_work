class CreateAccomplishments < ActiveRecord::Migration
  def self.up
    create_table :accomplishments do |t|
			t.column :accomplishment, :text
			t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :accomplishments
  end
end
