class AddShowOnHomepageToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :showOnHomepage, :boolean
  end
end
