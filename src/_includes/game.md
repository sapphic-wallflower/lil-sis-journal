---
layout: default
ogType: article
# What can be used
# layout:
# title:
# description:
# titleImage:
# ogImage:
# completionImage:
# milestones:
#     - name:
#       time:
#       date:
# timeplayed:
# date:
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