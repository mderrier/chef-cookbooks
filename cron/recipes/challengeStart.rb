cron "challengeHebdo" do
  hour "*"
  minute "*"
  weekday "*"
  command "cd /srv/www/oklm/current && php app/console oklm:challenge:send-start"
end