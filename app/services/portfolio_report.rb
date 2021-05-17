class PortfolioReport
  def initialize(user)
    @smg  = StockMarketGateway.new
    @user = user
  end

  # @param [Range<Date or Rational>] date_range
  # @return [Array][Hash]
  def twr(date_range = Time.zone.today - 30.days..Time.zone.today)
    invested = @user.portfolio.investmented / @user.portfolio.companies.count

    @user.portfolio.companies.map do |company|
      stock_data   = StockValue.where(company: company, day: date_range).pluck(:value)
      growth       = Twr.calculate(stock_data, invested) / 100

      { company: company.name, growth: growth, first_day: date_range.first, last_day: date_range.last }
    end
  end
end
