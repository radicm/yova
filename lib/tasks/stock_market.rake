namespace :stock_market do
  desc "Sync stock market data"
  task sync: :environment do
    Company.all.each_with_index do |company, index|

      if index > 0 && index % 5 == 0
        puts "Free API throttling (1min)"
        sleep(1.minute)
      end

      smg  = StockMarketGateway.new
      # NOTE: If api had date filter we would only fetch current day and not all days
      data = smg.fetch(company.name)

      data.each do |d|
        sv = StockValue.find_or_initialize_by(company: company, day: d[:date])
        sv.update(value: d[:value], company: company) unless sv.persisted?
      end
        puts company.name

      # NOTE: Free API call frequency is 5 calls per minute and 500 calls per day.
    end
  end
end
