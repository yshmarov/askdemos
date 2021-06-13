class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      flash[:notice] = "Account has been created"
      redirect_to root_url(subdomain: @account.subdomain)
    else
      flash.now[:alert] = "Account has not been created"
      render :new
    end
  end

  private

    def account_params
      params.require(:account).permit(:name, :subdomain)
    end
end
