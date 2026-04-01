---
description: Record a narrated browser walkthrough video
argument-hint: [walkthrough-name]
---

Record a narrated browser walkthrough video using the walkthrough-recorder skill.

**If a walkthrough name is given**, run the recorder for that walkthrough:

```bash
npx tsx walkthrough-recorder/src/record.ts walkthrough-recorder/walkthroughs/<name>.ts
```

**If no name is given**, list available walkthroughs:

```bash
ls walkthrough-recorder/walkthroughs/*.ts
```

**To create a new walkthrough**, ask the user what flow they want to record, then create
a new `.ts` file in `walkthrough-recorder/walkthroughs/` following the `WalkthroughDefinition`
type from `walkthrough-recorder/src/types.ts`.

Before running, verify prerequisites:
1. `piper --version` — Piper TTS must be installed
2. `ffmpeg -version` — FFmpeg must be installed
3. Voice model exists at `walkthrough-recorder/voices/en_US-lessac-medium.onnx`
4. The target app is running (default: http://localhost:5267)

Options:
- `--voice <path>` — Use a different Piper voice model
- `--audio-only` — Generate narration WAVs only
- `--video-only` — Record browser only, no TTS
- `--output <dir>` — Custom output directory
