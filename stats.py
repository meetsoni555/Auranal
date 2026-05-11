import os
from collections import Counter
from datetime import datetime, timedelta

vault_path = os.path.expanduser("~/Auranal/vault/")
categories = []
moods = []

now = datetime.now()
one_week_ago = now - timedelta(days=7)

if os.path.exists(vault_path):
    for filename in os.listdir(vault_path):
        if filename.endswith(".txt"):
            file_path = os.path.join(vault_path, filename)
            file_time = datetime.fromtimestamp(os.path.getmtime(file_path))
            
            if file_time > one_week_ago:
                with open(file_path, 'r') as f:
                    for line in f:
                        if "|[" in line and "]:" in line:
                            cat = line.split("[")[1].split("]")[0].strip()
                            if cat: 
                                categories.append(cat)
                        
                        if "Overall.. -> [" in line:
                            mood = line.split("[")[1].split("]")[0].strip()
                            if mood: 
                                moods.append(mood)

cat_counts = Counter(categories)
mood_counts = Counter(moods)
total_entries = sum(cat_counts.values())

if not cat_counts:
    print("\n [ No entries found for this week! ]\n")
else:
    print("\nAURA-Journaling Stats")
    print("-----------------------")
    
    print("\nCATEGORIES (This Week)")
    print("-----------------------")
    for cat, count in cat_counts.most_common():
        percentage = (count / total_entries) * 100
        # Using a standard block character for the bar
        bar = "█" * count
        print(f"{cat:<12} | {bar:<10} {count} ({percentage:.0f}%)")

    print("\nMOOD VIBES")
    print("-----------------------")
    for mood, count in mood_counts.most_common():
        bar = "█" * count
        print(f"{mood:<12} | {bar} ({count})")
    
    print("\n--> QUICK INSIGHTS (Last 7 Days)")
    print("-------------------------------")
    
    prod_count = cat_counts.get("Work", 0) + cat_counts.get("Coding", 0)
    prod_percent = (prod_count / total_entries) * 100 if total_entries > 0 else 0
    
    if prod_percent > 70:
        status = "Absolute Beast Mode!"
    elif prod_percent > 40:
        status = "Pretty Productive!"
    else:
        status = "Chilling & Vibing"

    print(f"Weekly Logs   : {total_entries}")
    print(f"Productivity  : {prod_percent:.1f}% ({status})")
    
    if moods:
        top_mood, top_count = mood_counts.most_common(1)[0]
        print(f"Weekly Energy : {top_mood}")
    
    print("\n" + "─" * 31)
