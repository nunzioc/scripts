#! /usr/bin/fish

# gets todays tasks from schedule and adds them to a file called today_tasks
awk -v date=(date +"%b %d") '$1 != "-" { today="false" } today == "true" { print } $1 " " $2 == date { today="true"  }' Schedule.md > today_tasks.md

# update schedule
awk -v date=(date +"%b %d") '$1 != "-" { del="" } $1 " " $2 == date { del = "true" } del == "" { print }' Schedule.md > Schedule.md

# creates new daily file
cat today_tasks.md Data/System/daily_todo.md Data/System/week_todos/(date +"%A").md > (date +"%b_%d").md

# remove today_tasks since it has been used P.S. I should use a variable instead of a file
rm today_tasks.md

# if you completed a task yesterday, hit the beeminder endpoint
if test (awk '/^-\ \[x\]/ { n += 1 } END { print n ? n : 0 }' (date --date="yesterday" +"%b_%d").md) = "0"
    echo "you failed to complete a task yesterday"
else
    curl 'https://maker.ifttt.com/trigger/update_beeminder/with/key/yk8eUU2Akt-GDIOp3o21E'
end

# moves yesterday's file to archive
mv (date --date="yesterday" +"%b_%d").md Data/Daily/

# IN PROGRESS #
