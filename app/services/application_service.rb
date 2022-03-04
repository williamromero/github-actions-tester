class ApplicationService
  def self.call(*args)
    new(*args).call # Creating an instance of Object and the method CALL from the service.
  end
end
