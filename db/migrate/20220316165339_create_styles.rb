class CreateStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :styles do |t|
      t.string :name
      t.string :resume_drop
      t.string :strategy
      t.string :take_home
      t.string :product_case

      t.timestamps
    end
  end
end
