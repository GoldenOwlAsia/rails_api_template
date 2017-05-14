class BaseSerializer < ActiveModel::Serializer
  # serialization_scope :current_user

  attributes :created_at,
             :updated_at

end
