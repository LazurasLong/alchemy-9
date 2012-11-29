class PagesController < ApplicationController
  caches_page :index, :show
  layout "pages", :only => [:index, :show]

  before_filter :homepage
  before_filter :default_menu_pages

  def index
    @page = @homepage
    @parent_elements = Element.where("parent1 IS NULL AND parent2 IS NULL")
    @elements = Element.all
    check_404
  end

  def show
    @page = Page.where("permalink = ?", params[:permalink]).first
    check_404
  end
 
  def check_elements
   # render :text => params.inspect 
    element1 = Element.where( name: params[:element1] ).first
    element2 = Element.where( name: params[:element2] ).first
    @element = Element.where("(parent1 = ? AND parent2 = ?) || (parent1 = ? AND parent2 = ?)", element1.id, element2.id, element2.id, element1.id).first
    if @element
      render :partial => "/pages/partials/success", :locals => { :element => @element, :id1 => params[:id1], :id2 => params[:id2] }
    else
      render :partial => "/pages/partials/failed", :locals => { :id1 => params[:id1], :id2 => params[:id2] }
    end
  end

  private
  def default_menu_pages
  	menu_id = Menu.select("id").where(:name => "default").first
    @pages = Page.position_order(menu_id)
  end

  def check_404
    render_404 if @page.nil? || @homepage.permalink == params[:permalink] ||  @page.active == false # render_404 on application controller
  end
  
  def homepage
    @homepage = Page.first_page 
  end
  
end
