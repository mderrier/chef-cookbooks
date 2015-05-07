cron "newsletter" do
  hour "13"
  minute "00"
  weekday "0"
  command "cd /srv/www/oklm/current && php app/console oklm:challenge:send-daily"
end