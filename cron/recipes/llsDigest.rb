cron "llsDigest" do
  hour "5"
  minute "00"
  command "cd /srv/www/oklm/current && php app/console lls:stat"
end