class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.bigint :owner_id    , null: felse
      t.string :name        , null: felse
      t.string :place       , null: felse
      t.datetime :stard_at  , null: felse
      t.datetime :end_at    , null: felse
      t.text :content       , null: felse
      t.timestamps
    end
  end
end
