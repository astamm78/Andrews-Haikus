class Mailer < ActionMailer::Base

  def contact(line_1, line_2, line_3, id)
    @line_1 = line_1
    @line_2 = line_2
    @line_3 = line_3
    @id = id
    mail(
      :to      => "Andrew Stamm <andrewstamm@me.com>, Rod Levy <rodlevy1@gmail.com>, Milan Bhandari <milan_bhandari@hotmail.com>, Brett Friell <brett.friell@gmail.com>, Quinlan H DeMay <qdemay@yahoo.com>, Emily Patton <emilydpatton@yahoo.com>, Joe Levickas <joelevickas@gmail.com>, Erik Stanley <erikuofi@yahoo.com>, Lindsey Nordmark <behindstyle@hotmail.com>, Emily Lovig <emilylovig@gmail.com>, Erin Sanders <erinrenay@gmail.com>, Beau Sievers <beau.sievers@gmail.com>, Cameron Honsa <chonsa1@gmail.com>, Travis Saunders <macdhaibhidh@hotmail.com>, Hannah Halder <hannah.halder@gmail.com>, Kate Donahoe <donahoe@gmail.com>, Francisco Quinteros <faquinteros@gmail.com>, Amy Singleterry <singleta418@yahoo.com>, Cassie Speer <cassafrass_00@yahoo.com>, Kimberly Berls <kimberlyberls@gmail.com>, Kelly Daily <kellykdaily@gmail.com>, Neil Bhandari <neil.bhandari@gmail.com>, liz Abinante <eabinante@gmail.com>",
      :bcc     => "Squirrels 2013 <squirrels.2013@devbootcamp.com>",
      :from    => "andrewstamm@me.com",
      :subject => "Hump Day Haiku") do |format|
        format.text
        format.html
    end
  end

end