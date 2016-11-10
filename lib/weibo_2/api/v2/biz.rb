module WeiboOAuth2
  module Api
    module V2
      class Biz < Base
        #read interfaces
        def user_timeline(uids, opt={})
          opt.merge!(uids: uids)
          hashie get("statuses/user_timeline_batch.json", :params => opt)
        end

        #write interfaces
        def create_friendships(opt={})
          hashie post("friendships/create/biz.json", :params => opt)
        end

        def repost(id, opt={})
          hashie post("statuses/repost/biz.json", :params => {"id" => id}.merge(opt))
        end
      end
    end
  end
end
