---
layout: default
ogType: article
titleImage: banner.png
completionImage: complete.png
# What can be used // Copy to new game reviews
# layout: game
# title: xxxx | A Completionist Review
# description:
# ogImage: icon.png
# milestones:
#     - name: Beaten
#       time: 1 hour
#       date: 01 Jan 2000
#     - name: Completion
#       time: 3 hour
#       date: 01 Jan 2001
# timeplayed:
# date: 2026-01-01T24:00:00
# updateDate: 2026-01-01T24:00:00
# tags: blog, game_review, 
---
{{ content }}

<p class="date-footer">
    <time>Published {{ page.date | prettyDateTime }}</time>
    {%- if updateDate -%} <time>Updated {{ updateDate | prettyDateTime }}</time> {%- endif %}
</p>

---

## End of Game Information

Total Time Played: **{{ timeplayed }}**

|{% for milestone in milestones %} {{ milestone.name }} |{% endfor %}
|{% for milestone in milestones %} --- |{% endfor %}
|{% for milestone in milestones %} {{ milestone.time }} |{% endfor %}
|{% for milestone in milestones %} {{ milestone.date }} |{% endfor %}

<center><img class="imageLarge" src="{{ completionImage }}"></center>