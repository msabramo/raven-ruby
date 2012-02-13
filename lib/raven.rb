require 'socket'
require 'uri'

module Raven
  CLIENT_NAME = 'raven'
  CLIENT_VERSION = '0.1.0'
  PROTOCOL_VERSION = '2.0'

  def self.initialize(dsn=nil, name=nil, site=nil)
    if dsn.nil?
      dsn = ENV['dsn']
    end
    @config = self.parseDSN(dsn)
    if name.nil?
      name = Socket.gethostname()
    end
    @config[:name] = name
    @config[:site] = site
  end

  def self.parseDSN(dsn)
    uri = URI.parse(dsn)
    if !['http', 'https'].include(uri.scheme)
      raise ArgumentError, 'Unsupported Sentry DSN scheme: {#uri.scheme}'
    end
    path_bits = uri.path.rsplit('/', 1)
    if len(path_bits) > 1:
        path = path_bits[0]
    else
        path = ''
    end
    project = path_bits[-1]
    if not all([netloc, project, url.username, url.password]):
      raise ArgumentError, 'Invalid Sentry DSN: {#dsn}'
    end
    username, password = uri.userinfo

    config = {}
    config[:hosts] = [uri.host]
    config[:project] = project
    config[:public_key] = username
    config[:secret_key] = password
    return config
  end

  def self.captureException(exception)
  end

  def self.captureMessage(message)
  end


  def send()
  end
end