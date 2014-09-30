class BannerMenusController < AuthController

  def new
    @banner_menu = BannerMenu.new
  end

  def index
    @banner_menus = BannerMenu.all
  end

  def create
    @banner_menu = BannerMenu.new(banner_menu_params)
    if @banner_menu.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @banner_menu = BannerMenu.find(params[:id])
  end

  def destroy
    @banner_menu = BannerMenu.find(params[:id])
    if @banner_menu.delete
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  private

  def banner_menu_params
    params.require(:banner_menu).permit(:url, :picture)
  end

end