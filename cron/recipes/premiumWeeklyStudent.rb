cron "premiumWeeklyStudent" do
  hour "14"
  minute "00"
  weekday "0"
  command "cd /srv/www/oklm/current && php app/console oklm:premium:send-weekly-student"
end