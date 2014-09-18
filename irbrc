module Kernel
  def maks
    User.find_by_email(ENV['EMAIL'])
  end
end
