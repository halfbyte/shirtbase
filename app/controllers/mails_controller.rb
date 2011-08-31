class MailsController < ApplicationController
  skip_before_filter :verify_authenticity_token
    
  # this controller action is pretty insecure, but it tries to validate as much as possible.
  def create
    transloadit = Transloadit.new(
      :key    => ENV['TRANSLOADIT_AUTH_KEY'],
      :secret => ENV['TRANSLOADIT_AUTH_SECRET']
    )

    to = params[:to]
    subject = params[:subject]
    text = params[:text] || params[:html] # will be used as description
    
    match = to.match(/(.*)@.*/)
    if (user = User.find_by_mailbox(match[1]))
      attachment_count = params[:"attachments"].to_i
      if attachment_count > 0
        attachment_info = JSON.parse(params[:"attachment-info"])
        attachment_keys = attachment_info.select { |k,v| v['type'].match(/^image\//)}.map(&:first)
        attachments = []
        attachment_keys.each do |k|
          attachments.push(params[k])
        end
        unless attachments.empty?
          shirt = user.shirts.build(
            :name => subject,
            :description => text
          )
          shirt.owners << user
          if shirt.save
            transloadit.assembly(
              :template_id => "42cb74a7389c45da9e3739d63ff06cc7",
              :fields => { :shirt_id => shirt.to_param },
              :notify_url => shirt_images_url(shirt)
            ).submit!(*attachments)
          end
        end
      end
    end
    
    
    
    render :text => 'Thank you, Mr. Sendgrid'
  end
  
end
