class ShortenedUrlController < ApplicationController
  def create
    # TODO: validate the url
    # TODO: hash the url and take a substring to use as the short url
  end

  def show
    render plain: params[:hash]
    # TODO: get a url by it's hash and redirect to the long url
  end
end
