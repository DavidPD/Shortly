class ShortenedUrlController < ApplicationController

  def index
  end

  def create
    long_url = params[:long_url]

    @shortened_url = ShortenedUrl.find_by(long_url: long_url)
    if @shortened_url
      @shortened_url.long_url = 'found: ' + @shortened_url.long_url
    end

    if !@shortened_url
      url_hash = Digest::SHA256.base64digest(long_url + Time.now.to_i.to_s)
      url_hash.sub!(/=+$/, '')

      short_hash = url_hash[-8, 8]

      @shortened_url = ShortenedUrl.new(long_url: long_url, short_hash: short_hash)
      # TODO: handle '/' characters in hash
      if !@shortened_url.save
        return render :json => @shortened_url.errors
      end
    end

    if @shortened_url
      short_link = request.base_url + '/' + @shortened_url.short_hash
      render :json => {"long_url" => @shortened_url.long_url, "short_link" => short_link}
    end
    # TODO: Handle the possible case of a shortened hash collision
  end

  def show
    @shortened_url = ShortenedUrl.find_by(short_hash: params[:short_hash])

    if @shortened_url
      redirect_to @shortened_url.long_url
    end
  end
end
