class SourcesController < ApplicationController
  def index
    @source = Source.all
  end

  def create
    new_source = Source.create params[:source]
    new_source.topic_id = params[:name][:id]
    new_source.save

    #adds the source to the user's sources
    @current_user.sources << new_source

    redirect_to root_path
  end

  def new
    @new_source = Source.new
    @topic = Topic.all
  end

  def edit
  end

  def show
    @source = Source.find params[:id]
    sloppy_url = @source.url
    rss = Feedbag.find(sloppy_url).first
    feeds = Feedjira::Feed.fetch_and_parse(rss)
    @response = HTTParty.get (rss)
  end

  def follow
    source = Source.find params[:id]
    sloppy_url = source.url

    rss = Feedbag.find(sloppy_url).first
    if rss.present?
      feeds = Feedjira::Feed.fetch_and_parse(rss)
      @response = HTTParty.get (rss)
    end

    topic = Topic.find(source.topic_id)
    #the sources are not added to the user's sources if the rss url cannot be found.
    if @response["rss"].present?
      @current_user.sources << source
      binding.pry
      topic.users << @current_user
    end
    redirect_to root_path
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
