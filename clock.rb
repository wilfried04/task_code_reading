require "slack-notify"
require 'dotenv/load'
require 'clockwork'
include Clockwork
require 'active_support/time'
module Clockwork
  handler do |job|
      puts "Running #{job}"
      clock = SlackNotify::Client.new(webhook_url: "https://hooks.slack.com/services/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")
      clock.notify("hello, this message is sending each 3 minute")
  end

  every(3.minutes, 'less.frequent.job')
end
