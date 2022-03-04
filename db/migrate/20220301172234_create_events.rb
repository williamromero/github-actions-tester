class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :action
      t.text :payload
      t.text :user
      t.references :issue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
