class RenameVotableColumnToCommentable < ActiveRecord::Migration
  def change
  	rename_column :comments, :votable_id, :commentable_id
  	rename_column :comments, :votable_type, :commentable_type
  end
end
