class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.bigint :number, unique: true
      t.text :title

      t.timestamps
    end
  end
end
