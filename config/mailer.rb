configure do
  if production?
    ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.sendgrid.net',
      :port           => '587',
      :authentication => :plain,
      :user_name      => ENV['SENDGRID_USERNAME'],
      :password       => ENV['SENDGRID_PASSWORD'],
      :domain         => 'heroku.com',
      :enable_starttls_auto => true
    }
    ActionMailer::Base.view_paths = File.join(APP_ROOT, 'app', 'views')
  else
    ActionMailer::Base.delivery_method = :file
    ActionMailer::Base.file_settings = { :location => File.join(APP_ROOT, 'public', 'tmp/emails') }
    ActionMailer::Base.view_paths = File.join(APP_ROOT, 'app','views')
  end
end