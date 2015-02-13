cron "newsletter" do
  hour "11"
  minute "00"
  weekday "0"
  command "cd /srv/www/oklm/current && php app/console oklm:newsletter:send-coach"
end