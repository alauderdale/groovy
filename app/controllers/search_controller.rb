class SearchController < ApplicationController
	def index
		@shots = Shot.basic_search(params[:search]).page(params[:page]).order('created_at DESC')
		@users = User.basic_search(params[:search])
		# @shots += Shot.tagged_with(params[:search])
		@search = params[:search]
	end
end
