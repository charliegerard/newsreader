class SourcesController < ApplicationController
  def index
    @source = Source.all
  end

  def create
  end

  def new
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
    @current_user.sources << source
    redirect_to users_path
  end

  def update
  end

  def destroy
  end
end
