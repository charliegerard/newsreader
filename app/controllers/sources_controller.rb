class SourcesController < ApplicationController
  def index
    @source = Source.all
  end

  #Keep your routes in order of the flow of the website; 
  def new
    @new_source = Source.new
    @topic = Topic.all
  end

  def create
    #Before you create a source object, check if the source has a rss feed;
    @rss = Feedbag.find(params['source']['url']).first
    if @rss 
      @own_source = Source.create params[:source]
      @own_source.topic_id = params[:name][:id]
      if @own_source.save #If the source was saved then it cannot have already been in the database, this means the user can not have already had it as a source; 
        #adds the source to the user's sources if an rss feed can be found
        @current_user.sources << @own_source
        redirect_to root_path
      else
        flash[:notice] = "This source is already in the database and you can follow it"
        redirect_to new_source_path
      end
    else
      flash[:notice] = "Oops this url cannot be added, please try with another one"
      redirect_to new_source_path
    end
  end

  def edit
  end

  def show
    @source = Source.find params[:id]
    @response = @source.get_rss
    #It is best practice to keep your controllers thin and put logic into methods in the model; 
  end

  def follow
    #I do not think that we need to check the soure for rss here, we did that when we created the source; 
    source = Source.find params[:id]
    if source
      @current_user.sources << source
      redirect_to root_path
    else
      #Add a flash message in here saying that there has been an error..
      redirect_to :back
    end
  end

  def unfollow
    source = Source.find params[:id]
    @current_user.sources.delete(source)
    redirect_to root_path
  end

  def update
  end

  def destroy
  end
end
