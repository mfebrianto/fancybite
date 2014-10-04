class MenuItemsController < AuthController

  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update_attributes(menu_item_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.delete
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def show

  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :menu_category_id, :picture)
  end

end