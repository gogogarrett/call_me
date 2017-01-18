# CallMe

**TODO: Add description**


# Award Pets

Only checks complete_lesson's and _would_ it hasn't been awarded before

```elixir
Cellphone.Jepsen.publish_event("event.maths.complete_lesson", "2")
```

# Award Eggs

Only objects complete_activity events

```elixir
Cellphone.Jepsen.publish_event("event.maths.complete_activity", "2")
Cellphone.Jepsen.publish_event("event.rex.complete_activity", "2")
Cellphone.Jepsen.publish_event("event.re.complete_activity", "2")
```

# Reporting Events

saves anything

```elixir
Cellphone.Jepsen.publish_event("event.maths.complete_map_quiz", "2")
Cellphone.Jepsen.publish_event("event.rex.complete_lesson", "2")
Cellphone.Jepsen.publish_event("event.re.complete_lesson_quiz", "2")
```

# Progress Events

saves relevant messages that matter to progress

```elixir
Cellphone.Jepsen.publish_event("event.maths.complete_map_quiz", "2")
Cellphone.Jepsen.publish_event("event.rex.complete_lesson", "2")
Cellphone.Jepsen.publish_event("event.re.complete_lesson_quiz", "2")
```

# Mailers

## CompleteMap

Will send a specific mailer per product

```elixir
Cellphone.Jepsen.publish_event("event.maths.complete_map_quiz", "2")
Cellphone.Jepsen.publish_event("event.rex.complete_map_quiz", "2")
Cellphone.Jepsen.publish_event("event.re.complete_map_quiz", "2")
```

## Weekly

(do w/e)

## Finished a "grade"

(do w/e)

## Finished a book

```elixir
Cellphone.Jepsen.publish_event("event.re.complete_book", "2")
```
