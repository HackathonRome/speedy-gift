module ApplicationHelper
  def facebook_login
    oa = Koala::Facebook::OAuth.new(FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, registration_url)
    url = oa.url_for_oauth_code(permissions: [:user_friends, :user_likes,
                                              :friends_likes, :"friends_actions.video",
    :"friends_actions.books", :"friends_actions.music"]
                                )
    link_to "Login", url
  end

  EXCHANGE_RATES = { euro: 1, dollar: 0.728119994 }

  def price_in_euro(gift)
    in_euros = gift[:price] * EXCHANGE_RATES[ gift[:currency] ]

    number_to_currency in_euros, precision: 2,
                                 locale: :it,
                                 separator: ',',
                                 delimeter: ' ',
                                 unit: '&#8364;'.html_safe,
                                 format: "%n %u"
  end
end
