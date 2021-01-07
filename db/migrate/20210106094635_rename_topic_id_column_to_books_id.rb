class RenameTopicIdColumnToBooksId < ActiveRecord::Migration[5.2]
  def change
     rename_column :favorites, :topic_id, :book_id
  end
end
