class ShortenedUrlController < ApplicationController

  def index
  end

  def create
    # TODO: validate the url
    long_url = params[:long_url]
    url_hash = Digest::SHA256.base64digest long_url
    url_hash.sub!(/=+$/, '')

    short_hash = url_hash[-8, 8]

    render plain: short_hash + '    ' + url_hash
    # TODO: save the shortened url
    # TODO: Handle the possible case of a shortened hash collision
  end

  def show
    render plain: params[:hash]
    # TODO: get a url by it's hash and redirect to the long url
  end
end
