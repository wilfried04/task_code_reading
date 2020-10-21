require "slack-notify"
require 'dotenv/load'
require 'clockwork'
include Clockwork

m = 0
handler do |job|
  client = SlackNotify::Client.new(
    webhook_url: ENV["slack_webhook_url"],
    channel: "#programming",
    username: "ロボット"
  )
  if m >= 3
    client.notify("#{m}分経ちました。この投稿は自動送信されております。")
  else
    client.notify("この投稿は自動送信されております。")
  end
  m += 3
end
every(3.minutes, 'less.frequent.job')
