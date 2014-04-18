class ApplicationPresenter
  def self.build(objects)
    objects.map {|o| new(o) }
  end

  private

  def h
    ActionController::Base.helpers
  end
end
