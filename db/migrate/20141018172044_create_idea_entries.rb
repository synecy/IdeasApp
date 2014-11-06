class CreateIdeaEntries < ActiveRecord::Migration
  def change
    create_table :idea_entries do |t|
      t.string :title
      t.integer :votes
      t.boolean :secret, :default => false

      t.timestamps
    end
  end
end
