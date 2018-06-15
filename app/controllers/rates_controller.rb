class RatesController < ApplicationController
  before_action :check_current_rate
  before_action :set_rsymbols

  private

  def set_rsymbols
    @rsymbols = Rate.distinct.pluck(:rsymbol)
  end

  def check_current_rate
    if Rate.where(rdate: Date.today).count == 0
      StockExchanges::Hitbtc.new.courses.each do |r|
        Rate.create(r)
      end
    end
  end
end
