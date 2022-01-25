require 'discordrb'


bot = Discordrb::Commands::CommandBot.new token: 'token', client_id: 934444448207761458,
                         prefix:'!'
#"メッセージ関連はここに
bot.message(containing: "おは" ) do |event|
  event.respond ("#{event.author.mention} おはようございます！こんこんきーつね！")
end

bot.message(containing: "おつ") do |event|
  event.respond ("#{event.author.mention} おつ🌽じゃい！")
end

bot.message(containing: "赤い") do |event|
  event.respond ("赤いなぁ…")
end

bot.message(containing: "猫やんけ") do |event|
  event.respond ("#{event.author.mention} 狐じゃい!")
end

bot.message(containing: "ある？") do |event|
  event.respond 'なきりにしもあやめ'
end

bot.message(containing: "一緒に喋ろう") do |event|
  event.respond ("#{event.author.mention} いいよー！")
end

bot.message(containing: "暇" ) do |event|
  event.respond ("#{event.author.mention} 寝るのです！")
end
bot.message(containing: "疲れた") do |event|
  event.respond("#{event.author.mention} 頑張ったね！！お疲れ様だぞい！(^・ω・^§)ﾉ")
end
bot.message(containing: "ありがとう") do |event|
  event.respond("#{event.author.mention}いえいえ！")
end
#"gif
bot.command :yabe do |event|
  event.respond "https://c.tenor.com/ZprD3ck1BkkAAAAC/shirakami-fubuki-hololive.gif"
end
bot.command :happy do |event|
  event.respond "https://c.tenor.com/R3wEtTLXGJsAAAAd/fubuki-fubuki-hololive.gif"
end
bot.command :hatena do |event|
  event.respond "https://i.pinimg.com/originals/2a/0a/2a/2a0a2a1021e29f96173e35bc17f5b326.gif"
end
bot.voice_state_update do |event|
  if !event.user.bot_account
    #デフォルトのチャンネルに通知
    begin
      default_text_channel = nil
      event.server.channels.each do |channel|
        if channel.type == 0
          default_text_channel ||= channel.id
          default_text_channel = channel.id if channel.name == 'general'
        end
      end
      exit unless default_text_channel
    rescue SystemExit => err
      puts "[WARN] There is no text channel."
    end

    #チャンネルに入ったときだけ通知
    if event.old_channel.nil?
      # text notification
      text = "#{event.user.name}さんが#{event.channel.name}に入りました！"
      event.bot.send_message(default_text_channel, text)
    end
  end
end
#vcに入るコマンド
bot.command :join do |event|
  channel = event.user.voice_channel
  next "VCに入ってからコマンドを打ってね!" unless channel
  bot.send_message(channel)
  "{channel.name}に入ったぞい！"
end
bot.command :spotify do |event|
  event.respond "https://open.spotify.com/playlist/37i9dQZF1EpNEiYPrNdhqe?si=7743b5128a224761"
end
bot.command :song do |event|
  event.respond "https://www.youtube.com/playlist?list=PL1NeGg1woXqlISJkxjgwHKgB8LmR7tk92"
end
bot.command :random do |event|
  event.respond "#{rand(10000)} が今日のラッキーナンバーだぞい!!!(^・ω・^§)ﾉ"
end

bot.run

