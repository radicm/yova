module Api
  module V1
    class NotificationSerializer < ActiveModel::Serializer
      attributes :id,
                 :content,
                 :seen_at
    end
  end
end
