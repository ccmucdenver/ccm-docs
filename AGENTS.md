# AGENTS.md

This file defines strict operating constraints for any agent working in this repository.

## 1. Mission and Scope

- Mission: maintain accurate, stable, and readable CCM documentation.
- Scope: documentation content and site configuration only.
- Default mode: conservative edits with minimal blast radius.

## 2. Authority and Sources of Truth

- Treat current repository files as authoritative unless a user explicitly overrides.
- Treat `readthedocs.io` as the primary build and rendering target; prefer RTD-compatible choices over local-only behavior.
- Do NOT apply global chagnes to fles in legacy sucbdirectory and to updates.md, unless requested explicitly.
- Secondary targets:
  - hosted under a web server anywhere
  - local `file://site/index.html` build through the existing `Makefile`
- For operational cluster status, treat the latest dated entry in `docs/updates.md` as authoritative.
- Do not invent infrastructure facts (nodes, partitions, limits, outages, versions).
- If a fact is uncertain, leave a TODO note and ask for confirmation instead of guessing.

## 3. Allowed Changes

- Allowed files:
  - `docs/**/*.md`
  - `mkdocs.yml`
  - `Makefile`
- Allowed change types:
  - typo/grammar fixes
  - formatting cleanup
  - broken internal link fixes
  - navigation consistency updates
  - content synchronization across pages
  - prepend-only update entire to `docs/updates.md` (unless user asks to reorganize history)

## 4. Disallowed Changes (Without Explicit User Approval)

- Disallowed files - control of rendering at readthedocs.io
  - `.readthedocs.yaml`
  - `docs/requirements.in`
  - `docs/requirements.txt`
- Deleting pages or large sections.
- Rewriting historical updates in ways that alter meaning.
- Changing legal/compliance language in `docs/TermsandConditions.md`.
- Changing account eligibility/allocation policy in `docs/accounts.md`.
- Changing public URLs, contact emails, or forms unless user requests it.
- Introducing new build systems, frameworks, or CI pipelines.

## 5. Required Content Rules

- Preserve existing chronology format in `docs/updates.md`:
  - headings as `### YYYY/MM/DD`
  - newest entries near top
- Keep terminology consistent:
  - `Slurm` (not `SLURM` unless quoting existing text intentionally)
  - `GPU` (not `GPUS`)
  - `Alderaan` spelling
- Prefer concise, user-facing wording; avoid internal jargon without explanation.
- Keep command examples copy-paste ready.

## 6. Linking and Navigation Rules

- If adding a new user-facing page, update `mkdocs.yml` nav in the same change.
- If removing/renaming a page, update all inbound links in docs.
- Avoid leaving orphaned pages unless intentionally archived and noted in commit/PR summary.

## 7. Safety and Change Size Limits

- Prefer small, atomic edits.
- For edits touching more than 3 files, provide a brief plan before modifying files.
- For edits touching `docs/updates.md`, include only the requested date window or entry.
- Never run destructive git commands (`reset --hard`, checkout discard, etc.).

## 8. Commits
- Reread all changed files.
- Commit changes in related groups only.
- For each change group, suggest commit message for approval first.
- After user approves, run the commit command through sandbox.

## 8. Validation Expectations

- Run available local checks when dependencies exist:
  - `mkdocs build`
  - targeted grep/ripgrep scans for broken local links and obvious typos
- If checks cannot run, state that clearly in the final report.

## 9. Output and Reporting

- Report:
  - files changed
  - what was changed and why
  - any assumptions or unresolved ambiguities
- When uncertain about policy/operations details, ask one focused follow-up question.

## 10. Priority Order for Conflicts

1. Explicit user instruction
2. This `AGENTS.md`
3. Existing repository conventions
4. Agent preference
