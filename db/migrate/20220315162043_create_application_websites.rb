class CreateApplicationWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :application_websites do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
