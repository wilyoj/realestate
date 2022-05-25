class EstatesController < ApplicationController
    before_action :authenticate_user!

  respond_to :html, :json
  
  def new
    @estate = Estate.new
  end
  
  def index
    @estates = Estate.all
  end
  
  def create
    @estate =  Estate.new(estate_params)
    if @estate.save
      flash[:success] = "Estate has been successfully registered"
      #Notifier.estate(current_admin).deliver # sends the email
      #mail = Notifier.estate(current_admin)  # => a Mail::Message object
      #mail.deliver                    # sends the email
      redirect_to estates_path
    else
      flash[:danger] = "Estate Not added. Please try again"
      render 'new'
    end
  end

  def edit
    @estate = Estate.find(params[:id])
  end
  
  def update
    @estate = Estate.find(params[:id])
    respond_to do |format|
      if @estate.update_attributes(estate_params)
        format.html { redirect_to(@estate, :success => 'Estate has been successfully updated') }
        format.json { respond_with_bip(@estate) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@estate) }
      end
    end
  end
  
  def show
    @estate = Estate.find(params[:id])   
  end

  def destroy
    Estate.find(params[:id]).destroy
    flash[:success] = "Estate deleted!!"
    redirect_to estates_url
  end
  
  private
  def estate_params
    params.require(:estate).permit(:name, :coordinates, :neighourhood, :schools, :crime, :nearby)
  end
end
