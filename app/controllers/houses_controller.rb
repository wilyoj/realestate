class HousesController < ApplicationController
    before_action :authenticate_user!

  respond_to :html, :json
  
  def new
    @house = House.new
  end
  
  def index
    @houses = House.all
  end
  
  def create
    @house =  House.new(house_params)
    if @house.save
      flash[:success] = "House has been successfully registered"
      #Notifier.house(current_admin).deliver # sends the email
      #mail = Notifier.house(current_admin)  # => a Mail::Message object
      #mail.deliver                    # sends the email
      redirect_to houses_path
    else
      flash[:danger] = "House Not added. Please try again"
      render 'new'
    end
  end

  def edit
    @house = House.find(params[:id])
  end
  
  def update
    @house = House.find(params[:id])
    respond_to do |format|
      if @house.update_attributes(house_params)
        format.html { redirect_to(@house, :success => 'House has been successfully updated') }
        format.json { respond_with_bip(@house) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@house) }
      end
    end
  end
  
  def show
    @house = House.find(params[:id])   
  end

  def destroy
    House.find(params[:id]).destroy
    flash[:success] = "House deleted!!"
    redirect_to houses_url
  end
  
  private
  def house_params
    params.require(:house).permit(:house_number, :nature, :rent, :bathrooms, :bedrooms, :description, :pets)
  end
end
