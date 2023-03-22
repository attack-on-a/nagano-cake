class SearchsController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @records = Item.search_for(@content)
    @record = @records.page(params[:page]).per(8)
    @genres = Genre.all
  end
end
