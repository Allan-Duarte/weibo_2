module WeiboOAuth2
  module Api
    module Biz
      class Place < V2::Place
        #read interfaces
        # https://c.api.weibo.com/2/place/nearby/pois/biz.json
        def nearby_pois(lat, long, opt={})
          hashie get("place/nearby/pois/biz.json", :params => {:lat => lat, :long => long}.merge(opt))
        end

        # https://c.api.weibo.com/2/place/pois/show/biz.json
        def place_show(poiid, opt={})
          hashie get("place/pois/show/biz.json", :params => {:poiid => poiid}.merge(opt))
        end
      end
    end
  end
end
