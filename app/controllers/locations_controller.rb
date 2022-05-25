class LocationsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :json
  
  def new
    @location = Location.new
  end
  
  def index
    @locations = Location.all
  end
  
  def create
    @location =  Location.new(location_params)
    if @location.save
      flash[:success] = "Location has been successfully registered"
      #Notifier.location(current_admin).deliver # sends the email
      #mail = Notifier.location(current_admin)  # => a Mail::Message object
      #mail.deliver                    # sends the email
      redirect_to locations_path
    else
      flash[:danger] = "Location Not added. Please try again"
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    respond_to do |format|
      if @location.update_attributes(location_params)
        format.html { redirect_to(@location, :success => 'Location has been successfully updated') }
        format.json { respond_with_bip(@location) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@location) }
      end
    end
  end
  
  def show
    @location = Location.find(params[:id])   
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Location deleted!!"
    redirect_to locations_url
  end
  
  private
  def location_params
    params.require(:location).permit(:name, :country, :county, :subcounty)
  end

end
