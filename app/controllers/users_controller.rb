class UsersController < ApplicationController
  before_filter :check_if_logged_in, :except => [:create, :new]
  before_filter :check_if_admin, :only => [:index]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.save
      session[:user_id] = @user.id
      redirect_to topics_path
    else
      render :new
    end

  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update_attributes params[:user]
    redirect_to user
  end

  def destroy
  end

  def feed
   @topics = Topic.all
   @my_sources = []
   @source_array =[]
   @current_user.sources.last(3).each do |s|
      sloppy_url = s.url
      rss = Feedbag.find(sloppy_url).first
      if rss.present?
        feeds = Feedjira::Feed.fetch_and_parse(rss)
        @response = HTTParty.get (rss)
        source =[]
        source << s.name
        source << @response["rss"]["channel"]["item"][0]["title"]
        @my_sources << source          
      end
    end
  end

  private
  def check_if_logged_in
    redirect_to(root_path) if @current_user.nil?
  end

  def check_if_admin
    redirect_to(root_path) if @current_user.nil? || @current_user.admin == false
  end
end
