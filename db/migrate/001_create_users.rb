class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
			t.column :email, :string, :limit => 100
			t.column :first_name, :string, :limit => 100
			t.column :last_name, :string, :limit => 100
			t.column :permanent_login, :string
			t.column :password, :string, :limit => 50
			t.column :current_status, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
