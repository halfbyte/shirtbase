atom_feed do |feed|
  if @user
    feed.title("#{@user.nickname}'s shirts")
  elsif @tag
    feed.title("shirts tagged with #{@tag}")
  else
    feed.title("latest shirts from the shirties")
  end
  feed.updated(@shirts.first.created_at)

  for shirt in @shirts
    feed.entry(shirt) do |entry|
      entry.title(shirt.name)
      entry.content(render(:partial => 'shirts/feed_item', :object => shirt, :as => :shirt), :type => 'html')

      entry.author do |author|
        author.name(shirt.user.nickname)
      end
    end
  end
end