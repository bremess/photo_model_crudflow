class PhotosController < ApplicationController
  #create
  def new
    @var=Photo.new   #create the instance variable to display an error in the show page
    render "new"
  end 
  def create
    @var=Photo.new
    @var.caption=params["caption"]
    @var.photo=params["photo"]
    if @var.save
      redirect_to photo_url(@var.id)#redirect_to "/photos/#{@var.id}"
    else
       render "new"
    end   
  end 
  
  
  #Read
  def show
        @var=Photo.find_by(:id => params[:id])
        if @var.present?
            render "show"
        else
            redirect_to photos_url, :notice => "The record doesn't exit"
        end
  end
  
  def index
    @var=Photo.all
    render "index"
  end
  
  #Update
  def edit
    @var=Photo.find(params[:id])
    render "edit"
  end
  
  def update
    @var=Photo.find(params[:id])
    @var.caption = params["caption"]
    @var.photo   = params["photo"]
    @var.save
    redirect_to photo_url(@var.id)
  end
  
  
  #Destroy
  def destroy
    @var=Photo.find(params[:id])
    @var.destroy
    redirect_to photos_url
  end

end