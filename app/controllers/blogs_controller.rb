class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :must_logged_in, only: %i[new edit show destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = if params[:back]
              Blog.new(blog_params)
            else
              Blog.new
            end
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'Clone was successfully created.'
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit; end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'Clone was successfully created.'
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログを削除しました！'
  end

  def confirm
    @blog = current_user.blogs.new(blog_params)
    render :new if @blog.invalid?
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  # idをキーとして値を取得するメソッド
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def must_logged_in
    redirect_to new_session_path unless logged_in?
  end
end
