class AddDataUpdaterToSoupkitchensTable < ActiveRecord::Migration[5.2]
  def data
    execute <<-SQL.squish
        UPDATE soupkitchen
           SET comments_count = (SELECT count(1)
                                   FROM comments
                                  WHERE comments.post_id = posts.id)
    SQL
  end

end