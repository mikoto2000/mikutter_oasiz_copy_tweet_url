# -*- coding: utf-8 -*-

Plugin.create(:oasiz_copy_tweet_url) do
    command(:oasiz_copy_tweet_url,
        name: 'Copy tweet URL',
        condition: Plugin::Command[:HasOneMessage],
        visible: true,
        role: :timeline) do |opt|
            message = opt.messages.first
            screen_name = message.user[:idname]

            Gtk::Clipboard.copy("https://twitter.com/#{screen_name}/status/#{message.id}")
    end
end
