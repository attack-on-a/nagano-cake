class SearchsController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]

    if @model == 'item'
      @records = Item.saled.search_for(@content).order('id DESC').page(params[:page]).per(8)
    elsif @model == 'genre'
      genre = Genre.search_for(@content)
      @records = Item.saled.where(genre_id:genre.ids).page(params[:page]).per(8)
    end

    if @model == 'item'
      @records_count = Item.saled.search_for(@content).count
    elsif @model == 'genre'
      @records_count = Item.saled.where(genre_id:genre.ids).count
    end


    @genres = Genre.all

  end
end
