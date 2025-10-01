
## Tasks

- [x] Tarea configuración Pomodoro Timer [🍅:: 1/2] 📅 2025-09-30 ^d35i
- [ ] Desarrollo de Daily Note en IFCT79-PKM [🍅:: 4/3] 📅 2025-09-30 ^35fi
- [ ] Práctico de redes [🍅:: 0/2]

## Summary view

```dataviewjs
const pages = dv.pages();
const emoji = "🍅";
dv.table(
  ["Date", "Pomodoros", "Total"],
  pages.file.lists
    .filter((item) => item?.pomodoro == "WORK")
    .groupBy((item) => {
      if (item.end && item.end.length >= 10) {
        return item.end.substring(0, 10);
      } else {
        return "Unknown Date";
      }
    })
    .map((group) => {
      let sum = 0;
      group.rows.forEach((row) => (sum += row.duration.as("minutes")));
      return [
        group.key,
        group.rows.length > 5
          ? `${emoji}  ${group.rows.length}`
          : `${emoji.repeat(group.rows.length)}`,
        `${sum} min`,
      ];
    })
)
```
---

## Pomodoros work(1m)

- 🍅 (pomodoro::WORK) (duration:: 1m) (begin:: 2025-09-30 08:35) - (end:: 2025-09-30 08:36)
- 🥤 (pomodoro::BREAK) (duration:: 1m) (begin:: 2025-09-30 08:36) - (end:: 2025-09-30 08:37)
- 🍅 (pomodoro::WORK) (duration:: 1m) (begin:: 2025-09-30 08:37) - (end:: 2025-09-30 08:38)
- 🥤 (pomodoro::BREAK) (duration:: 1m) (begin:: 2025-09-30 08:38) - (end:: 2025-09-30 08:39)
- 🍅 (pomodoro::WORK) (duration:: 1m) (begin:: 2025-09-30 08:39) - (end:: 2025-09-30 08:40)
- 🥤 (pomodoro::BREAK) (duration:: 1m) (begin:: 2025-09-30 08:40) - (end:: 2025-09-30 08:41)
- 🍅 (pomodoro::WORK) (duration:: 1m) (begin:: 2025-09-30 08:41) - (end:: 2025-09-30 08:42)
- 🍅 (pomodoro::WORK) (duration:: 1m) (begin:: 2025-09-30 08:43) - (end:: 2025-09-30 08:44)
- 🍅 (pomodoro::WORK) (duration:: 1m) (begin:: 2025-09-30 08:45) - (end:: 2025-09-30 08:46)
- 🍅 (pomodoro::WORK) (duration:: 1m) (begin:: 2025-09-30 10:35) - (end:: 2025-09-30 10:37)
- 🍅 (pomodoro::WORK) (duration:: 1m) (begin:: 2025-09-30 10:55) - (end:: 2025-09-30 10:56)
- 🍅 (pomodoro::WORK) (duration:: 45m) (begin:: 2025-09-30 10:57) - (end:: 2025-09-30 11:42)
- 🍅 (pomodoro::WORK) (duration:: 25m) (begin:: 2025-09-30 12:04) - (end:: 2025-09-30 12:29)