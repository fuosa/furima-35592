class PurchaseController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new
  end