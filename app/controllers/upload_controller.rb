class UploadController < ApplicationController
  def get
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(params[:picture])
    if @picture.save
      puts @picture
      #redirect_to(:controller => 'picture', :action => 'show', :id @picture.id)
      redirect_to(:action => 'show', :id => @picture.id)
      #redirect_to :back
    else
      render(:action => :get)
    end
  end
  
  def show
    @picture = Picture.find(params[:id])
  end
  
  def picture
    @picture = Picture.find(params[:id])
    send_data(@picture.data,
              :filename => @picture.name,
              :type => @picture.content_type,
              :disposition => "inline")
  end
  
end
