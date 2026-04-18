---
layout: default
ogType: article
# What can be used
# layout: blog
# title:
# description:
# titleImage:
# ogImage:
# date: 2026-01-01T24:00:00
# updateDate: 2026-01-01T24:00:00
# tags: blog, 
---
{{ content }}

<p class="date-footer">
    <time>Published {{ page.date | prettyDateTime }}</time>
    {%- if updateDate -%} <time>Updated {{ updateDate | prettyDateTime }}</time> {%- endif %}
</p>