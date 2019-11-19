class FoodController < ApplicationController

	def index
    @posts = Post.all
  end
end
