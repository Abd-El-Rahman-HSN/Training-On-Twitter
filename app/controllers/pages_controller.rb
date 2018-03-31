class PagesController < ApplicationController
  def index
  end

  def home
    following = Array.new
    for @f in current_user.following do
      following.push(@f.id)
end

    @post = Post.where("user_id IN (?)", following)
    @newpost = Post.new
  end

  def porfile    
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to "" ,:notice=> "User Not Found"      
    end

    @post = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newpost = Post.new

    @toFollow = User.all.last(5)
  end

  def explore
    @post = Post.all
    @newpost = Post.new
    @toFollow = User.all.last(5)
  end
end
 