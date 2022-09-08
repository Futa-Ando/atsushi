class MapsController < ApplicationController

    def index
        @maps = Map.all
        @map = Map.new
    end

    def new
        @map = Map.new
    end

    def show
        @map = Map.find(params[:id])
    end

    def search

    end

    def create
        map = Map.new(map_params)
        if map.save
            redirect_to :action => "index"
        else
            redirect_to :action => "index"
        end
    end

    def destroy
        map = Map.find(params[:id])
        map.destroy
        redirect_to action: :index
    end

    def hashtag
        @user = current_user
        @tag = Hashtag.find_by(hashname: params[:name])
        @maps = @tag.maps
    end

    private
    def map_params
    params.require(:map).permit(:address, :latitude, :longitude, :title, :sns, :range1, :range2, :caption)
    end

end
