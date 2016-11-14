module WeiboOAuth2
  module Api
    module V2
      class Biz < Base
        #read interfaces
        def user_timeline(uids, opt={})
          opt.merge!(uids: uids)
          hashie get("statuses/user_timeline_batch.json", :params => opt)
        end

        # https://c.api.weibo.com/2/statuses/show_batch/biz.json
        def show_status(id, opt={})
          opt.merge!({ :ids => id })
          hashie get("statuses/show_batch/biz.json", :params => opt)
        end

        # https://c.api.weibo.com/2/comments/show/biz.json
        def load_comments(post_id, opt={})
          opt.merge!({ :id => post_id })
          hashie get("comments/show/biz.json", :params => opt)
        end

        #write interfaces
        # https://c.api.weibo.com/2/friendships/create/biz.json
        def create_friendships(opt={})
          hashie post("friendships/create/biz.json", :params => opt)
        end

        # https://c.api.weibo.com/2/statuses/repost/biz.json
        def repost(id, opt={})
          hashie post("statuses/repost/biz.json", :params => {"id" => id}.merge(opt))
        end

        # https://c.api.weibo.com/2/comments/create/biz.json
        def create_comment(comment, id, opt={})
          hashie post("comments/create/biz.json", :params => {:comment => comment, :id => id}.merge(opt))
        end
      end
    end
  end
end
