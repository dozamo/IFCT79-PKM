---
tags:
  - weekly_note
---
# <% tp.file.title %>

:LiArrowLeft: <% fileDate = moment(tp.file.title, "gggg-[W]ww").subtract(1, "weeks").format("gggg-[W]ww") %>   <% fileDate = moment(tp.file.title, "YYYY-MM-DD").subtract(1, "d").format("dddd, DD MMMM YYYY") %> | <% moment(tp.file.title, "YYYY-MM-DD").subtract(1, "d").format("YYYY") %>-W<% moment(tp.file.title, "YYYY-MM-DD").add(-1, "d").week() %> | [[Journal/Daily/]]<% fileDate = moment(tp.file.title, "YYYY-MM-DD").add(1, "d").format("YYYY-MM-DD") %><% fileDate = moment(tp.file.title, "YYYY-MM-DD").add(1, "d").format("dddd, DD MMMM YYYY") %> :LiArrowRight: