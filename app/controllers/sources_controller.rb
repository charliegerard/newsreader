class SourcesController < ApplicationController
  def index
    @source = Source.all
  end

  def create
    @source = Source.all
    # @source.each do |s|
    #   @url = s.url
    # end

    @own_source = Source.create params[:source]
    @own_source.topic_id = params[:name][:id]
    #adds the source to the user's sources if an rss feed can be found
    input_url = @own_source.url
    @rss = Feedbag.find(input_url).first
    #Add own sources to user sources if not there yet.
    # binding.pry
    if @rss && @current_user.sources.select{|source| source.url == @rss } == []
      @own_source.save
      @current_user.sources << @own_source
      redirect_to root_path
    else
      redirect_to new_source_path
    end
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
    #Look for rss feed from the url and if found, parse the content
    rss = Feedbag.find(sloppy_url).first
    if rss.present?
      feeds = Feedjira::Feed.fetch_and_parse(rss)
      @response = HTTParty.get (rss)
    end

    topic = Topic.find(source.topic_id)
    #the sources are not added to the user's sources if the rss url cannot be found.
    if @response["rss"].present?
      @current_user.sources << source
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
