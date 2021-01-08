class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.bigint :owner_id    , null: false
      t.string :name        , null: false
      t.string :place       , null: false
      t.datetime :stard_at  , null: false
      t.datetime :end_at    , null: false
      t.text :content       , null: false
      t.timestamps
    end
  end
end
