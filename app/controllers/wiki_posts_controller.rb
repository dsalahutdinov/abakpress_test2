class WikiPostsController < ApplicationController
  before_filter :get_wiki_post

  def index
    @wiki_posts = WikiPost.where(:parent_id => nil).all
  end

  def show
    @wiki_post = @parent
  end

  def new
    @wiki_post = WikiPost.new
    @wiki_post.parent = @parent
  end

  def edit
    @wiki_post = @parent
  end

  def create
    @wiki_post = WikiPost.new(params[:wiki_post])
    @wiki_post.parent = @parent

    if @wiki_post.save
      redirect_to @wiki_post.get_path, notice: 'Wiki post was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @wiki_post = @parent

    if @wiki_post.update_attributes(params[:wiki_post])
      redirect_to @wiki_post.get_path, notice: 'Wiki post was successfully updated.'
    else
      render action: "edit"
    end
  end

  private
  def get_wiki_post
    if (params[:ids].blank?)
      @parent = nil
    else
      @parent = WikiPost.find_by_path(params[:ids])
    end
  end
end
