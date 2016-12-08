module WeiboOAuth2
  module Api
    module Biz
      class Users < V2::Users
        # https://c.api.weibo.com/2/users/show_batch/other.json
        def show(opt={})
          hashie get("users/show_batch/other.json", :params => opt)
        end

        def show_by_uid(uid)
          show({"uids" => uid.to_i})
        end
      end
    end
  end
end
