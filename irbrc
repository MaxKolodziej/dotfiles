module Kernel
  def maks
    User.find_by_email(ENV['EMAIL'])
  end

  def set_as_pro_coach(coach_profile)
    require './lib/indexing_coaches'
    coach_profile.update_column(:pro_coach, true)
    IndexingCoaches.new.index(Coach.new(coach_profile.for_indexing))
  end
end

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
