class BannerMenusController < AuthController

  def index
    @menu_categories = MenuCategory.all
  end

  def new
    @menu_category = MenuCategory.new
  end

  def create
    @menu_category = MenuCategory.new(menu_category_params)
    if @menu_category.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  private

  def menu_category_params
    params.require(:menu_category).permit(:name)
  end

end