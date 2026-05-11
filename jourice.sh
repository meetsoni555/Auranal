#!/bin/bash

#all the paths here
VAULT="$HOME/Auranal/vault/"

#for the streaks 
STREAK_FILE="$HOME/Auranal/.streak"
LAST_LOG_FILE="$HOME/Auranal/.last_log"
TODAY=$(date +%Y-%m-%d)
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)

[ ! -f "$STREAK_FILE" ] && echo "0" > "$STREAK_FILE"
[ ! -f "$LAST_LOG_FILE" ] && echo "1970-01-01" > "$LAST_LOG_FILE"

LAST_LOG=$(cat "$LAST_LOG_FILE")
CURRENT_STREAK=$(cat "$STREAK_FILE")

if [ "$LAST_LOG" == "$YESTERDAY" ]; then
  
    CURRENT_STREAK=$((CURRENT_STREAK + 1))
elif [ "$LAST_LOG" == "$TODAY" ]; then
  
    CURRENT_STREAK=$CURRENT_STREAK
else
  
    CURRENT_STREAK=1
fi

echo "$CURRENT_STREAK" > "$STREAK_FILE"
echo "$TODAY" > "$LAST_LOG_FILE"

# for displaying the streak
if [ "$CURRENT_STREAK" -gt 1 ]; then
    gum style \
    --foreground 226 --border-foreground 226 --border rounded \
    --align center --width 40 --margin "1 2" \
    "🔥 $CURRENT_STREAK DAY STREAK! 🔥" "You're on fire!"
else
    gum style --foreground 86 "Welcome back! Let's start a new streak today."
fi

sleep 1.5

clear 



#categories

category=$(gum filter --placeholder "Select a Category" < Categories.txt)

if [ "$category" == "Custom" ]; then
  echo "New category.. "
  newcat=$(gum input --placeholder "Enter the name of the new category..")
  echo "$newcat" >> "Categories.txt"
  category="$newcat"
fi

  

clear 
echo "<---------------->" >> "$VAULT$(date +'%A_%d_%b').txt"
echo "$category"
echo "$(date +'%a %d %b %H:%M')|[$category]: " >> "$VAULT$(date +'%A_%d_%b').txt"
echo "" >> "$VAULT$(date +'%A_%d_%b').txt"
echo "-----------"

#for the journaling 
journal=$(gum write --placeholder "What happened today? " >> "$VAULT$(date +'%A_%d_%b').txt")

clear


#mood

echo "How was your mood then..?"
mood=$(gum filter --placeholder "How was your mood today" < moods.txt)

clear 

if [ "$mood" == "New" ]; then
  newmood=$(gum input --placeholder "Describe in your own words")
  echo "$newmood" >> "moods.txt"
  mood="$newmood"
fi
  

echo "$journal" >> "$VAULT$(date +'%A_%d_%b').txt"
echo "Overall.. -> [$mood]" >> "$VAULT$(date +'%A_%d_%b').txt"
echo "<---------------->" >> "$VAULT$(date +'%A_%d_%b').txt"

gum spin --spinner dot --title "Saving..." -- sleep 0.3
gum style \
--foreground 212 --border-foreground 12 --border double \
--width 20 --margin "2 2" --padding "1 2 " \
'SAVED !!'
sleep 0.5 
clear


sleep 0.4

#exiting..

exit=$(gum choose "GoodNight 󰤄  " "Read_Journal")

if [ "$exit" == "GoodNight 󰤄  " ]; then 
  gum style \
	--foreground 212 --border-foreground 12 --border double \
  --width 50 --margin "1 2" --padding "1 2" \
	'GoodNight 󰤄 , Sweet Dreams !!'  
	sleep 1.5 
	clear 
  
elif [ "$exit" == "Read_Journal" ]; then
  gum pager < "$VAULT$(date +'%A_%d_%b'.txt)"
fi



































