class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.bigint :owner_id
      t.string :name
      t.string :place
      t.datetime :stard_at
      t.datetime :end_at
      t.text :content

      t.timestamps
    end
  end
end
