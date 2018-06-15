class RatesController < ApplicationController
  before_action :check_current_rate
  before_action :set_rsymbols

  def show
    id = (params[:id] == 'xxxxxx' ? @rsymbols.first : params[:id])
    @rate = Rate.find_by_rsymbol(id)
  end

  def archive
    @date = params[:date]
    @rates = Rate.where(rdate: @date)
  end

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
