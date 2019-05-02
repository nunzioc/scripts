#! /usr/bin/fish
# go to iawriter folder
cd /home/ncicone/Sync/IAWriter

# gets todays tasks from schedule and adds them to a file called today_tasks
set todayTasks (awk -v date=(date +"%b %d") '$1 != "-" { today="false" } today == "true" { print } $1 " " $2 == date { today="true"  }' Schedule.md) 

# get uncompleted tasks from yesterday 
set yesterdayTasks (awk -v daily="false" '$1 == "Daily" { daily="true" } /^-\ \[\ \]/ && daily="false" { print "(y)" $0 }' (date --date="yesterday" +"%b_%d").md) 

# creates new daily file
echo $todayTasks $yesterdayTasks | cat - Data/System/daily_todo.md Data/System/week_todos/(date +"%A").md > (date +"%b_%d").md


# if you completed a task yesterday, hit the beeminder endpoint
if test (awk '/^-\ \[x\]/ { n += 1 } END { print n ? n : 0 }' (date --date="yesterday" +"%b_%d").md) = "0"
    echo "you failed to complete a task yesterday"
else 
    curl 'https://maker.ifttt.com/trigger/update_beeminder/with/key/yk8eUU2Akt-GDIOp3o21E'
end


# moves yesterday's file to archive
mv (date --date="yesterday" +"%b_%d").md Data/Daily/

# IN PROGRESS #
