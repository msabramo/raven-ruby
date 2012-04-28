require File.dirname(__FILE__) + '/helper'

class TestParseDSN < Test::Unit::TestCase

    def test_basic
        config = Raven::parseDSN('https://foo:bar@sentry.local/1')

        assert_equal '1', config[:project]
        assert_equal ['https://sentry.local/api/store/'], config[:servers]
        assert_equal 'foo', config[:public_key]
        assert_equal 'bar', config[:secret_key]
    end

    def test_path
        config = Raven::parseDSN('https://foo:bar@sentry.local:9000/app/1')

        assert_equal '1', config[:project]
        assert_equal ['https://sentry.local:9000/app/api/store/'], config[:servers]
        assert_equal 'foo', config[:public_key]
        assert_equal 'bar', config[:secret_key]
    end

    def test_port
        config = Raven::parseDSN('https://foo:bar@sentry.local:9000/1')

        assert_equal '1', config[:project]
        assert_equal ['https://sentry.local:9000/api/store/'], config[:servers]
        assert_equal 'foo', config[:public_key]
        assert_equal 'bar', config[:secret_key]
    end

    def test_http
        config = Raven::parseDSN('http://foo:bar@sentry.local/1')

        assert_equal '1', config[:project]
        assert_equal ['http://sentry.local/api/store/'], config[:servers]
        assert_equal 'foo', config[:public_key]
        assert_equal 'bar', config[:secret_key]
    end

    def test_http_with_port
        config = Raven::parseDSN('http://foo:bar@sentry.local:9000/1')

        assert_equal '1', config[:project]
        assert_equal ['http://sentry.local:9000/api/store/'], config[:servers]
        assert_equal 'foo', config[:public_key]
        assert_equal 'bar', config[:secret_key]
    end

    def test_https_port_443
        config = Raven::parseDSN('https://foo:bar@sentry.local:443/1')

        assert_equal '1', config[:project]
        assert_equal ['https://sentry.local/api/store/'], config[:servers]
        assert_equal 'foo', config[:public_key]
        assert_equal 'bar', config[:secret_key]
    end

    def test_https_port_80
        config = Raven::parseDSN('https://foo:bar@sentry.local:80/1')

        assert_equal '1', config[:project]
        assert_equal ['https://sentry.local:80/api/store/'], config[:servers]
        assert_equal 'foo', config[:public_key]
        assert_equal 'bar', config[:secret_key]
    end

end
