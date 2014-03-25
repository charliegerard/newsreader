class SourcesController < ApplicationController
  def index
    @source = Source.all
  end

  def create
    new_source = Source.create params[:source]
    new_source.save

    @current_user.sources << new_source

    @source = Source.all
    @source << new_source

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
    # @select = JSON(response)
  end

  def follow
    source = Source.find params[:id]
    #I'm not sure what I'm doing here but the sources are not added to the user if the rss feed cannot be found.
    sloppy_url = source.url
    rss = Feedbag.find(sloppy_url).first
    if rss.present?
      feeds = Feedjira::Feed.fetch_and_parse(rss)
      @response = HTTParty.get (rss)
    end

    if @response["rss"].present?
      @current_user.sources << source
    end
    redirect_to root_path
  end

  def unfollow
    source = Source.find params[:id]
    @current_user.sources.delete(source)
    redirect_to users_path
  end

  def update
  end

  def destroy
  end
end
