module WeiboOAuth2
  module Api
    module Biz
      class Friendships < V2::Friendships

        #write interfaces
        # https://c.api.weibo.com/2/friendships/create/biz.json
        def create(opt={})
          hashie post("friendships/create/biz.json", :params => opt)
        end

        # https://c.api.weibo.com/2/friendships/destroy/biz.json
        def destroy(opt={})
          hashie post("friendships/destroy/biz.json", :params => opt)
        end

      end
    end
  end
end
