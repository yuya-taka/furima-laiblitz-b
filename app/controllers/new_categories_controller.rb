class NewCategoriesController < ApplicationController
  def new
    @new_categories = NewCategory.new
    @mainnewcategories = NewCategory.all.order("id ASC").limit(13)
  end
end
