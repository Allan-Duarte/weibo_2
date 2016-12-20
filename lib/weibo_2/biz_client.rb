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

    def comments
      @comments ||= WeiboOAuth2::Api::Biz::Comments.new(@access_token) if @access_token
    end

    def users
      @users ||= WeiboOAuth2::Api::Biz::Users.new(@access_token) if @access_token
    end

    def statuses
      @statues ||= WeiboOAuth2::Api::Biz::Statuses.new(@access_token) if @access_token
    end

    def friendships
      @friendships ||= WeiboOAuth2::Api::Biz::Friendships.new(@access_token) if @access_token
    end

    def place
      @place ||= WeiboOAuth2::Api::Biz::Place.new(@access_token) if @access_token
    end    
  end
end
