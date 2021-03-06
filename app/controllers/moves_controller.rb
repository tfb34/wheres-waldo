class MovesController < ApplicationController
    #using the params, check if found, update game(find-> last) if necessary
	def create
        @character = Character.find(params[:character_id])
        @photograph = Photograph.find(params[:photo_id])
        x1 = @character.coordinates.first.col
        y1 = @character.coordinates.first.row
        x2 = @character.coordinates.last.col 
        y2 = @character.coordinates.last.row
        x = params[:x].to_i
        y = params[:y].to_i
        @characterFound = false
        @x = x+12;
        @y = y;
        if(x >= x1 && x <= x2 && y >= y1 && y<=y2)
            @rectWidth = (x1-x2).abs
            @rectHeight = (y1-y2).abs
            @top = [y1,y2].min
            @left = [x1,x2].min
            @characterFound = true
            Game.last.foundCharacter()
        end
        #if num of finds  == totalCharacters stop game, disable user from clicking on the board
        respond_to do |format|
             format.js 
        end
	end
end
