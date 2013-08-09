class SearchController < ApplicationController
	def index
		@shots = Shot.basic_search(params[:search]).page(params[:page]).order('created_at DESC')
		@users = User.basic_search(params[:search])
		# @shots = Shot.basic_search(params[:search])+Shot.tagged_with(params[:search]).page(params[:page]).order('created_at DESC')
		@search = params[:search]
	end
end
