require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: 'OTM0NDQ0NDQ4MjA3NzYxNDU4.YewLNQ.cVeVoJ6I1qyOjqOpsojisg0-VJE', client_id: 934444448207761458,
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
#"bot起動
bot.run
