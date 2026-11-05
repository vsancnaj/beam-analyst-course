---
name: frame
description: Turns a business question into a short note with the question, the decision behind it and the audience, and creates the run folder under outputs/. Use first, before any data work. If no decision is named, it asks and stops.
user-invocable: true
allowed-tools: Read Bash Write Glob AskUserQuestion
argument-hint: "<the business question>"
---

Frame this question: $ARGUMENTS

If the question above is empty, ask for it and stop. Never invent one.

Get the business question, the decision behind it and the audience into one note that every later step reads.

## Steps

1. Check the parts below against what the user wrote.
2. **Gate:** if no decision is named, ask the user and stop. Do not continue without one. Never reconstruct a decision yourself. Ask the same way if what would change the decision is missing.
3. Create the run folder `outputs/<date>_<slug>/`. The date is today's date as defined in `AGENTS.md` (the data's end date, not the real date). The slug is 2 to 4 words in kebab-case describing the question.
4. Read what exists: list the files in `data/` and read the notes in `knowledge/beam/`. Use file names and notes only. Never print raw rows.
5. Write `frame.md` in the run folder with the sections below.
6. Finish with the run folder path and the one-sentence question. Nothing else.

## What frame.md contains

- **Question:** one sentence.
- **Decision:** the choice someone will make with the answer, and who makes it.
- **Audience:** who reads the brief.
- **What would change the decision:** the result that would push the decision one way and the result that would push it the other, agreed before looking at any data. Never reconstruct it yourself.
- **Tables likely involved:** the tables from `data/` that the question needs, one line each saying why. Mark any table that has no note in `knowledge/beam/`, because `profile` will have to write one.

## Checks before you stop

- [ ] Question is stated in one sentence
- [ ] A decision is named
- [ ] Audience is named
- [ ] What would change the decision is named
- [ ] Run folder exists and `frame.md` is inside it
- [ ] Every table listed exists in `data/`

## What this is NOT

- Not the analysis. Do not compute anything.
- Not the profile. Do not describe columns or quality; only say which tables are needed.
