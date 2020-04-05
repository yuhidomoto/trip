require 'base64'
require 'json'
require 'net/https'
module Vision
  class << self
    def get_image_data(image_file)
      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['GOOGLE_VISION_API_KEY']}"
      # 画像をbase64にエンコード
      # if Rails.env.production?
      #   base64_image = Base64.encode64(open(image_file.url).read)
      # else
      base64_image = Base64.encode64(open("#{Rails.root}/public/uploads/#{image_file.id}").read)
      # end
      # APIリクエスト用のJSONパラメータ
      params = {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            {
              type: 'LABEL_DETECTION'
            }
          ]
        }]
      }.to_json
      # Google Cloud Vision APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      begin
        response = https.request(request, params)
      rescue => e
        logger.info e
      end
      # APIレスポンス出力
      JSON.parse(response.body)['responses'][0]['labelAnnotations'].pluck('description').take(3)
    end
  end
end