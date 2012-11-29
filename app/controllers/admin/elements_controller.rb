class Admin::ElementsController < ApplicationController
  layout "admin" # :admin_user_layout
  before_filter :authenticate_user!

  def index
    @elements = Element.includes(:father).includes(:mother)
  end

  def new
    @element = Element.new
    @elements = Element.all
  end

  def edit
    @element = Element.find(params[:id])
    @elements = Element.where("id != ?", @element.id)
  end

  def create
    @element = Element.new(params[:element])
    if @element.save
      redirect_to new_admin_element_url, notice: 'Element was successfully created.'
    else
      @elements = Element.all
      render action: "new" 
    end
  end

  def update
    @element = Element.find(params[:id])  
    if @element.update_attributes(params[:element])
      redirect_to admin_elements_url, notice: 'Element was successfully updated.'
    else
      @elements = Element.where("id != ?", @element.id)
      render action: "edit"
    end
  end

  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    redirect_to admin_elements_url, notice: "Element successfully deleted."
  end
end
