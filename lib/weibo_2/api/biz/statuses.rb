module WeiboOAuth2
  module Api
    module Biz
      class Statuses < V2::Statuses
        #read interfaces
        # https://c.api.weibo.com/2/statuses/show_batch/biz.json
        def show(id, opt={})
          opt.merge!({ :ids => id })
          hashie get("statuses/show_batch/biz.json", :params => opt)
        end

        # https://c.api.weibo.com/2/statuses/user_timeline_batch.json
        def other_user_timeline(uids, opt={})
          opt.merge!(uids: uids)
          hashie get("statuses/user_timeline_batch.json", :params => opt)
        end

        #write interfaces
        # https://c.api.weibo.com/2/statuses/repost/biz.json
        def repost(id, opt={})
          hashie post("statuses/repost/biz.json", :params => {"id" => id}.merge(opt))
        end
      end
    end
  end
end
