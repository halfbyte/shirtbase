class CreateMailboxes < ActiveRecord::Migration
  def up
    User.all.each do |u|
      u.send(:ensure_mailbox)
      u.save
      puts "u.nickname has mailbox #{u.mailbox} now."
    end
  end

  def down
  end
end
