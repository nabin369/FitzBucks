class ProfitLossClientController < ApplicationController
  def new
  end

  def create
    start_date = DateTime.parse(params[:start_date])
    end_date   = DateTime.parse(params[:end_date])

    @client_presenters = ProfitLossClientPresenter.present(start_date, end_date)

    render "report"
  end
end
