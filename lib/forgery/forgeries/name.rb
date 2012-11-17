class Forgery::Name < Forgery

  def self.unique_full_name(n)
    "#{self.full_name} #{n}"
  end

end
