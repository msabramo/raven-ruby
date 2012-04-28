require 'socket'
require 'uri'

class Raven
  CLIENT_NAME = 'raven'
  CLIENT_VERSION = '0.1.0'
  PROTOCOL_VERSION = '2.0'

  attr_accessor :config

  def initialize(dsn=nil, name=nil, site=nil)
    if dsn.nil?
      dsn = ENV['dsn']
    end

    @config = self.class.parseDSN(dsn)

    if name.nil?
      name = Socket.gethostname()
    end

    @config[:name] = name
    @config[:site] = site
  end

  def self.parseDSN(dsn)
    uri = URI.parse(dsn)

    if !['http', 'https'].include?(uri.scheme)
      raise ArgumentError, 'Unsupported Sentry DSN scheme: {#uri.scheme}'
    end

    path_bits = uri.path.rpartition('/')

    if path_bits.length > 1:
        path = path_bits[0]
    else
        path = ''
    end

    project = path_bits[-1]

    #if not all([netloc, project, url.username, url.password]):
      #raise ArgumentError, 'Invalid Sentry DSN: {#dsn}'
    #end

    username, password = uri.userinfo.split(':')

    netloc = uri.host

    if (uri.scheme == 'http' and uri.port != 80) or (uri.scheme == 'https' and uri.port != 443)
        netloc += ":#{uri.port}"
    end

    config = {}
    config[:servers] = ["#{uri.scheme}://#{netloc}#{path}/api/store/"]
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
