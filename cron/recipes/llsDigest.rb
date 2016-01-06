cron "premiumWeeklyStudent" do
  hour "3"
  minute "00"
  command "cd /srv/www/oklm/current"
  #command "cd /srv/www/oklm/current && php app/console oklm:premium:send-weekly-parent"
end