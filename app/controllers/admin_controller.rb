class AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  before_action :set_current_admin

  def index
    @orders = Order.where.not(status: [:completed, :cancelled]).order(created_at: :asc).take(5)
    @quick_stats = {
      sales: Order.where(created_at: Time.now.midnight..Time.now).count,
      revenue: Order.where(created_at: Time.now.midnight..Time.now).sum(:total).round,
      avg_sale: Order.where(created_at: Time.now.midnight..Time.now).average(:total)&.round || 0,
      per_sale: OrderProduct.joins(:order).where(orders: { created_at: Time.now.midnight..Time.now }).average(:quantity) || 0
    }
    
    @orders_by_day = Order.where('created_at > ?', Time.now - 7.days).order(:created_at)
    @orders_by_day = @orders_by_day.group_by { |order| order.created_at.to_date }
    @revenue_by_day = @orders_by_day.map { |day, orders| [day.strftime("%A"), orders.sum(&:total)] }
  
    if @revenue_by_day.count < 7
      # Backfill 0 in those days where the data for that day is not available
      days_of_the_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
      data_hash = @revenue_by_day.to_h
      current_day = Date.today.strftime("%A")
      current_day_index = days_of_the_week.index(current_day)
      next_day_index = (current_day_index + 1) % 7
  
      ordered_days_with_current_last = days_of_the_week[next_day_index..-1] + days_of_the_week[0...next_day_index]
      complete_ordered_array_with_current_last = ordered_days_with_current_last.map { |day| [day, data_hash.fetch(day, 0)] }
  
      @revenue_by_day = complete_ordered_array_with_current_last
    end
  end

  private

  def set_current_admin
    @current_admin = current_admin
  end
end
