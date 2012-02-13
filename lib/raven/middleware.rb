class RavenMiddleware
  def initialize(app, client)
    @app = app
    @client = client
  end

  def call(env)
    @app.call(env)
  rescue Exception => exception
    @client.captureException(exception)
  end
end
