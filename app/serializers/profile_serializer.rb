class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user, :first_name, :last_name, :usernames

  def user
    UserSerializer.new(object.user).attributes
  end

  def usernames
    User.all.pluck(:name)
  end

end
