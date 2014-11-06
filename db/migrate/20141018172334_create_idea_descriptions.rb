class CreateIdeaDescriptions < ActiveRecord::Migration
  def change
    create_table :idea_descriptions do |t|
      t.string :description
      t.integer :votes

      t.timestamps
    end
  end
end
