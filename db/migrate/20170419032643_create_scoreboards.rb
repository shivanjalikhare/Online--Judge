class CreateScoreboards < ActiveRecord::Migration[5.0]
  def change
    create_table :scoreboards do |t|
      t.string :team
      t.string :correctness
      t.string :creativity
      t.string :relevance
      t.string :sustainability
      t.string :userExperience
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :scoreboards, [:user_id, :created_at]
  end
end
