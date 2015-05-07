cron "challengeWeekly" do
  hour "14"
  minute "00"
  weekday "4"
  command "cd /srv/www/oklm/current && php app/console oklm:challenge:send-weekly"
end