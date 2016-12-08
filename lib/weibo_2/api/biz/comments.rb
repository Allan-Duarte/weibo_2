module WeiboOAuth2
  module Api
    module Biz
      class Comments < V2::Comments
        #read interfaces
        # https://c.api.weibo.com/2/comments/show/biz.json
        def show(post_id, opt={})
          opt.merge!({ :id => post_id })
          hashie get("comments/show/biz.json", :params => opt)
        end

        #write interfaces
        # https://c.api.weibo.com/2/comments/create/biz.json
        def create(comment, id, opt={})
          hashie post("comments/create/biz.json", :params => {:comment => comment, :id => id}.merge(opt))
        end

        # https://c.api.weibo.com/2/comments/destroy/biz.json
        def destroy(comment_id, opt={})
          hashie post("comments/destroy/biz.json", :params => {:cid => comment_id}.merge(opt))
        end
      end
    end
  end
end
