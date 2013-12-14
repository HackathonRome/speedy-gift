module ApplicationHelper
  def facebook_login
    oa = Koala::Facebook::OAuth.new(FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, registration_url)
    url = oa.url_for_oauth_code(permissions: [:user_friends, :user_likes,
                                              :friends_likes, :"friends_actions.video",
    :"friends_actions.books", :"friends_actions.music"]
                                )
    link_to "Login", url
  end
end
