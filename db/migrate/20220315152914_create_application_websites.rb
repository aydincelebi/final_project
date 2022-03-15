class CreateApplicationWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :application_websites do |t|
      t.integer :name
      t.string :url

      t.timestamps
    end
  end
end
