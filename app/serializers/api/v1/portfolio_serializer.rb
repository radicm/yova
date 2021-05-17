module Api
  module V1
    class PortfolioSerializer < ActiveModel::Serializer
      attributes :id,
                 :company,
                 :growth,
                 :first_day,
                 :last_day
    end
  end
end
