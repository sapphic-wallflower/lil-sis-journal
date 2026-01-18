---
layout: default
ogType: article
# What can be used // Copy to new game reviews
# layout: game
# title: xxxx | A Completionist Review
# description:
# titleImage:
# ogImage:
# completionImage:
# milestones:
#     - name: Beaten
#       time: 1 hour
#       date: 01 Jan 2000
#     - name: Completion
#       time: 3 hour
#       date: 01 Jan 2001
# timeplayed:
# date: 2026-01-01T24:00:00
# tags: game_review, 
---
{{ content }}

<p style="text-align: right;">
<sub>
Published {{ page.date | prettyDateTime }}
</sub>
</p>

---

## End of Game Information

Total Time Played: **{{ timeplayed }}**

|{% for milestone in milestones %} {{ milestone.name }} |{% endfor %}
|{% for milestone in milestones %} --- |{% endfor %}
|{% for milestone in milestones %} {{ milestone.time }} |{% endfor %}
|{% for milestone in milestones %} {{ milestone.date }} |{% endfor %}

<center><img src="{{ completionImage }}" style="width: 100%"></center>