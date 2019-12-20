module Kernel
  def maks
    User.find_by_email(ENV['EMAIL'])
  end
end

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.connection_pool.clear_reloadable_connections!
