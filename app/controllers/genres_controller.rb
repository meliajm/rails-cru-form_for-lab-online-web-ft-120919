class GenresController < ApplicationController

    def show
        @genre = Genre.find(params[:id])
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(class_params(:name, :bio))
        redirect_to genre_path(@genre)
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(class_params(:name, :bio))
        redirect_to genre_path(@genre)
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    private

	def class_params(*args)
		params.require(:genre).permit(*args)
	end
end