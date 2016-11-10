require 'oauth2'

module WeiboOAuth2
  class BizClient < WeiboOAuth2::Client
    def initialize(client_id='', client_secret='', opts={}, &block)
      super(client_id, client_secret, opts)
      @site = "https://c.api.weibo.com/2/"
    end

    def get_token_from_hash(hash)
      access_token = hash.delete(:access_token) || hash.delete('access_token')
      @access_token = WeiboOAuth2::AccessToken.new( self, access_token, hash.merge(:header_format => 'OAuth2 %s', :param_name => 'access_token') )
    end

    def biz
      @biz ||= WeiboOAuth2::Api::V2::Biz.new(@access_token) if @access_token
    end
  end
end
