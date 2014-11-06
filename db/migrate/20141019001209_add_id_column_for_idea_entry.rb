class AddIdColumnForIdeaEntry < ActiveRecord::Migration
  def change
  	add_column :idea_entries, :uuid, :string
  end
end
