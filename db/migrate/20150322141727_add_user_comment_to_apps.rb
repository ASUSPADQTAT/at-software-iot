class AddUserCommentToApps < ActiveRecord::Migration
  def change

      add_column :apps,:Tester ,:string
  	  	add_column :apps,:TesterResult ,:string
  	  	add_column :apps,:TesterComment ,:string



  end
end
