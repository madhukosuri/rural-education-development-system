class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name
  has_one :profile, serializer: ProfileSerializer, root: :profile
  has_many :posts, serializer: PostSerializer, root: :post
end
