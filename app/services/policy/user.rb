module Policy
  class User
    def self.notifications(data, user)
      data.all? { |n| n.user_ids.include? user.id }
    end

    def self.portfolios(portfolio_user, user)
      user.admin? || portfolio_user.id == user.id
    end
  end
end
