class ShortenedUrlController < ApplicationController

  def index
  end

  def create
    # TODO: validate the url
    long_url = params[:long_url]
    url_hash = Digest::SHA256.base64digest long_url
    url_hash.sub!(/=+$/, '')

    short_hash = url_hash[-8, 8]

    @shortened_url = ShortenedUrl.new(long_url: long_url, short_hash: short_hash)
    # TODO: handle '/' characters in hash
    if @shortened_url.save
      render plain: request.base_url + '/' + short_hash
      # TODO: return json response
    else
      # TODO: return an error response
    end
    # TODO: Handle the possible case of a shortened hash collision
  end

  def show
    render plain: params[:short_hash]
    # TODO: get a url by it's hash and redirect to the long url
  end
end
