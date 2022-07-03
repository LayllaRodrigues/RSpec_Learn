class User
  def initialize(name)
    @name = name
    @count = 0
  end

  def save
    @count += 1 if @name.nil?
  end

  def count
    @count
  end
end
