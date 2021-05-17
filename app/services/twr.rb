class Twr
  # @param [Integer] stock_number
  # @param [Array][Integer] stock_data
  # @return [Float]
  def self.calculate(stock_data, initial_investment)
    # TWR = [(1 + (end_value - initial_value + cash_flow) / initial_value + cash_flow)...] - 1

    total = 0
    number_of_stocks = initial_investment / stock_data.first

    stock_data.each_with_index do |end_value, index|
      # NOTE: For every day except first day initial value is end value of prev day
      initial_value = index.zero? ? end_value : stock_data[index - 1]

      total = 1 + (end_value * number_of_stocks - initial_value * number_of_stocks) / initial_value * number_of_stocks
    end

    total - 1
  end
end
