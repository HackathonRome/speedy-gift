class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20],
                         image:auth.info.image,
                         oauth_token:auth.credentials.token
                        )
    end
    user
  end

  def friends
    f = koala.get_connections('me', 'friends?fields=id,name,picture.type(small)')
  end

  def friend(id)
    @friend ||= Friend.new(koala, id)
  end

  private

    def koala
      @koala ||= Koala::Facebook::API.new(oauth_token)
    end

end
