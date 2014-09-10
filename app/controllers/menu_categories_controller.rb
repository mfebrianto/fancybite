class MenuCategoriesController < AuthController

  def index
    @menu_categories = MenuCategory.all
  end

  def new
    @menu_category = MenuCategory.new
  end

  def create
    @menu_category = MenuCategory.new(params)
    if @menu_category.save
      render 'index'
    end
  end

end