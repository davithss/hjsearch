class SearchesController < ApplicationController

  def index
    query = params[:title].presence
    @searches = Search.search(query, track: true)
  end

  def create
    @search = Search.new(search_params.merge(user_ip: request.env['REMOTE_ADDR']))
    if @search.save
      Searchjoy::Search.create(
        search_type: "Search", # typically the model name
        query: params[:title]
        )
      redirect_to searches_path
    else
      render :index
    end
  end

  def autocomplete
    main_search
    key = @result.map(&:title).uniq
    value = @result.total_count
    render json: ["#{key.first} (#{value} searches)"]
  end

  def main_search
    @result ||= Search.search(params[:term],
                              fields: [{ title: :text_start }],
                              limit: 10,
                              load: false,
                              misspellings: false)
  end

  private

  def search_params
    params.permit(:title, :user_ip)
  end

end
