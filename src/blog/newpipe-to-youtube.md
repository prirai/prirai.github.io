---
layout: layouts/post.njk
title: Newpipe2Youtube
tags: 
    - tips
    - blog
date: 2025-01-23
---

Ever worried about being able to easily transfer subscriptions from yt to newpipe but not back? Deleted some and added some more subscriptions and then want to go back to the official youtube app for a bit? I made a bash script where you input the both files (yt CSV and newpipe json), and it tells you what changed, which subs deleted and which o…

[**newpipe2youtube.sh**](https://gist.github.com/prirai/74c214f9eb7205f42924ba4cf27b8aaf)
```shell
if [ "$#" -ne 2 ]; then
echo "Usage: $0 <youtube.csv> <newpipe.json> "
exit 1
fi

cat "$1" | cut -d ',' -f2- | sed 's/http:/https:/g' | sed 's/"//g' | sort | uniq > yt.txt

cat "$2" | sed 's/},/},\n/g' | sed 's/url":"/url":"\n/g' | grep -v '"url"' | sed 's/","name":"/,/g' | sed 's/"}.*//g' | sed 's/\\\\u2019/’/g' | sed 's/\\\\\u2013/–/g' | sort | uniq > np.txt

diff yt.txt np.txt

rm np.txt yt.txt
```
