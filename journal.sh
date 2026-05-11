#!/bin/bash

neofetch

JDAY="$HOME/texts/testingday.txt"
JTASKS="$HOME/texts/testingtask.txt"
TOTAL_GOALS=4

echo "Check-In $(date): " >> "$JDAY"
gum write --placeholder "How was your day today ?" >> "$JDAY"

echo "What tasks did you complete today?"

tasks=$(gum choose --limit 4 "C++" "Reading" "Typing" "CSES")

if [ -z "$tasks" ]; then
    echo "No tasks selected."
    exit
fi

echo "Tasks completed on $(date):" >> "$JTASKS"
echo "$tasks" >> "$JTASKS"

count=$(echo "$tasks" | wc -l)


echo "You finished $count out of $TOTAL_GOALS tasks."

if [ "$count" -eq "$TOTAL_GOALS" ]; then
  
  echo ""
  echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo "⠀⠀⠀⢠⡄⠀⠀⠀⠀⣇⠀⠀⠀⠀⠀⡸⢐⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  echo "⠀⠀⠀⢿⡙⠶⢄⣀⠀⢫⠒⢤⣀⠀⠀⢸⠰⠀⠀⣀⡤⣤⠤⠀⠀⠀"
  echo "⠀⠀⠀⠀⠉⢒⠦⠄⠈⠉⠁⠠⠀⠉⠉⠙⠃⠚⠉⣠⠎⠀⠀⠀⠀⠀"
  echo "⢀⣄⣠⡐⣈⡀⡄⠀⠀⢠⠀⢀⣴⣠⠀⠀⠀⠀⠀⠻⣀⠀⠀⠀⠀⠀"
  echo "⠀⠀⢨⠟⢁⢔⡁⢀⠔⠀⠐⣡⣯⠃⢠⠀⡆⢤⠀⡀⢰⡯⡒⠠⠤⠀"
  echo "⢀⣴⡵⣾⢗⣥⣶⣿⣷⣮⡼⢣⠃⢠⣧⣤⣯⣘⠀⢣⠀⣣⡏⠉⠚⠉"
  echo "⠟⠁⣸⣣⡃⢿⣿⣿⣿⣿⠷⠾⢶⣿⣿⣿⣿⣿⡆⣿⡀⢿⣸⡀⠀⠀"
  echo "⠀⢰⠋⠀⠀⠀⠉⠙⠉⠁⢀⣀⡀⠙⠛⠛⠛⠛⠑⡿⣯⣽⠋⣳⡆⠀"
  echo "⠀⠈⠳⢦⣄⡀⠀⠀⠘⣄⣀⣀⠼⠃⠀⠀⢀⠀⠠⠴⠿⠛⠋⠁⠀⠀"
  echo "⠀⠀⠀⠀⠀⠉⠉⠓⠒⠒⠤⠤⠤⠤⠔⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  
   gum style \
	--foreground 212 --border-foreground 12 --border double \
  --width 50 --margin "1 2" --padding "1 2" \
	'BE OBSESSED LIKE THIS !!'  
  
elif [ "$count" -ge 2 ]; then
  sleep 0.4
  echo""
  echo""
  echo "   ⡏⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿"
  echo "   ⣿⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠁⠀⣿"
  echo "   ⣿⣧⡀⠀⠀⠀⠀⠙⠿⠿⠿⠻⠿⠿⠟⠿⠛⠉⠀⠀⠀⠀⠀⣸⣿"
  echo "   ⣿⣿⣷⣄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿"
  echo "   ⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣴⣿⣿⣿⣿"
  echo "   ⣿⣿⣿⡟⠀⠀⢰⣹⡆⠀⠀⠀⠀⠀⠀⣭⣷⠀⠀⠀⠸⣿⣿⣿⣿"
  echo "   ⣿⣿⣿⠃⠀⠀⠈⠉⠀⠀⠤⠄⠀⠀⠀⠉⠁⠀⠀⠀⠀⢿⣿⣿⣿"
  echo "   ⣿⣿⣿⢾⣿⣷⠀⠀⠀⠀⡠⠤⢄⠀⠀⠀⠠⣿⣿⣷⠀⢸⣿⣿⣿"
  echo "   ⣿⣿⣿⡀⠉⠀⠀⠀⠀⠀⢄⠀⢀⠀⠀⠀⠀⠉⠉⠁⠀⠀⣿⣿⣿"
  echo "   ⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿"
  echo "   ⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿  𝐏𝐈𝐂𝐊𝐀𝐂𝐇 !! "
  
   gum style \
	--foreground 212 --border-foreground 12 --border double \
  --width 50 --margin "1 3" --padding "1 2" \
	'Haha .... Stay hard !!'  
	
else
  gum style --foreground 212 ""
  gum style --foreground 212 "   ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷"
  gum style --foreground 212 "   ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇"
  gum style --foreground 212 "   ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽"
  gum style --foreground 212 "   ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕"
  gum style --foreground 212 "   ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕"
  gum style --foreground 212 "   ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄"
  gum style --foreground 212 "   ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕"
  gum style --foreground 212 "   ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿"
  gum style --foreground 212 "   ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
  gum style --foreground 212 "   ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟"
  gum style --foreground 212 "   ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠"
  gum style --foreground 212 "   ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙"
  
  gum style \
	--foreground 212 --border-foreground 12 --border double \
  --width 50 --margin "1 3" --padding "1 2" \
	'Everything is within you ... Just GRIND!!' 
fi










