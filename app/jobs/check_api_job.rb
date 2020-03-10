class CheckApiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @deliveries = Delivery.all
    @deliveries.each do |delivery|
      puts "Updating Tracking"
      p delivery
      unless delivery.status == "Delayed" || delivery.fake == true
        delivery.update_tracking
      end
      puts "Updated #{delivery.name}"
    end
  end
end

