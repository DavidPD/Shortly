class ShortenedUrlController < ApplicationController

  def index
  end

  def create
    # TODO: validate the url
    long_url = params[:long_url]

    @shortened_url = ShortenedUrl.find_by(long_url: long_url)
    if @shortened_url
      @shortened_url.long_url = 'found: ' + @shortened_url.long_url
    end

    if !@shortened_url
      url_hash = Digest::SHA256.base64digest long_url
      url_hash.sub!(/=+$/, '')

      short_hash = url_hash[-8, 8]

      @shortened_url = ShortenedUrl.new(long_url: long_url, short_hash: short_hash)
      # TODO: handle '/' characters in hash
      if @shortened_url.save

      else
        @shortened_url = nil
        # TODO: return an error response
      end
    end

    if @shortened_url
      short_link = request.base_url + '/' + @shortened_url.short_hash
      render :json => {"long_url" => @shortened_url.long_url, "short_link" => short_link}
    end
    # TODO: Handle the possible case of a shortened hash collision
  end

  def show
    render plain: params[:short_hash]
    # TODO: get a url by it's hash and redirect to the long url
  end
end
