class SearchController < ApplicationController
	def index

		shots = Shot.basic_search(params[:search]) + Shot.tagged_with(params[:search])
		@users = User.basic_search(params[:search])
		@search = params[:search]
		@shots = shots.paginate page: params[:page] , per_page: 12
	end
end
