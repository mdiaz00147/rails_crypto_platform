class Api::V1::Client::VaultsController < Api::V1::Client::ClientsController
  skip_before_action :authenticate_request!, only: [:update_unilevel_investments_rewards, :update_binary_rewards]

  # show current user balances in several currencies
  def show
    vault = @current_user.vault
    if @current_user.respond_to? :vault
      balance_btc = (vault.amount / Currency.btc_usd).round(8)
      balance_ltc = (vault.amount / Currency.ltc_usd).round(8)
      balance_vault = vault.amount.round(2)
    else
      balance_btc = 0
      balance_ltc = 0
      balance_vault = 0
      balance_special = 0
      balance_fast = 0
    end

    render json: {
      balance_btc: balance_btc,
      balance_ltc: balance_ltc,
      balance_vault: number_to_currency(balance_vault),
      balance_special: number_to_currency(balance_special),
      balance_fast: number_to_currency(balance_fast)
    }, status: :ok
  end

end