ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "jay.kaye31@gmail.com",  
  :user_name            => "jay.kaye31",  
  :password             => "secret",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
} 