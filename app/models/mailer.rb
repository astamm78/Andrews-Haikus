class Mailer < ActionMailer::Base

  def contact(line_1, line_2, line_3, url)
    mail(
      :to      => "andrewstamm@me.com",
      :from    => "andrewstamm@me.com",
      :subject => "Hump Day Haiku") do |format|
        format.text
        format.html
    end
  end

end