class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @blog_posts = BlogPost.all
    end

    def show
        @blog_posts = BlogPost.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to "/"
    end

    def new
        @blog_posts = BlogPost.new
    end

    def create
        @blog_posts = BlogPost.new(blog_post_params)
        if @blog_posts.save
            redirect_to @blog_posts
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @blog_posts = BlogPost.find(params[:id])
    end

    def update
        @blog_posts = BlogPost.find(params[:id])
        if @blog_posts.update(blog_post_params)
            redirect_to @blog_posts
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @blog_posts = BlogPost.find(params[:id])
        @blog_posts.destroy
        redirect_to root_path
    end 

    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end


end