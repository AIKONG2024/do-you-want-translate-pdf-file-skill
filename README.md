# pdf-translate-skill

[KOREAN](README.ko.md)

Agent skill for translating PDFs while preserving layout as much as the selected engine allows.

- Works with Codex, Claude Code, and agents-compatible runtimes
- Uses the official `pdf2zh` CLI from PDFMathTranslate as the default engine
- Produces a final translated PDF

<img width="610" height="790" alt="image" src="https://github.com/user-attachments/assets/c1cd0770-ae2a-4df3-8f76-679c9da0858b" /><img width="610" height="790" alt="image" src="https://github.com/user-attachments/assets/2f6f2b6e-4e0a-4096-ba81-1334f13d678a" />

## Install

### Human

Ask your agent:

```text
AIKONG2024/pdf-translate-skill 스킬 설정해줘
```

### Agent

<details>
<summary>Open install instructions</summary>

Read this repository and install the `pdf-translate` skill into the skill directory used by the current agent runtime.

The skill folder to install is:

```text
pdf-translate/
```

The installed skill must include:

```text
pdf-translate/SKILL.md
pdf-translate/scripts/
pdf-translate/references/
pdf-translate/agents/
```

Use the installation method supported by the current runtime:

- If the runtime supports GitHub skill installation, install `AIKONG2024/pdf-translate-skill` with path `pdf-translate`.
- If the runtime supports the `skills` CLI, use:

```bash
npx --yes skills add https://github.com/AIKONG2024/pdf-translate-skill --all -g
```

- If the runtime only supports manual local skills, copy the `pdf-translate/` folder into that runtime's skill directory.

After installing the skill, check the runtime dependency:

```bash
pdf2zh --help
```

If `pdf2zh` is missing, install the official PDFMathTranslate CLI:

```bash
python -m pip install pdf2zh
```

If the runtime requires restart or reload to discover new skills, tell the user to restart or reload it.

</details>

## Setup

Default provider is Google, so no API key is required for a basic run. Cloud providers can receive extracted PDF text, so your agent must ask for confirmation before running them.

For higher quality or local/private translation, choose a provider and set only that provider's environment variables.

| Provider | Environment variables |
| --- | --- |
| Google | None |
| DeepL | `DEEPL_AUTH_KEY` |
| OpenAI | `OPENAI_API_KEY`, optional `OPENAI_MODEL` |
| Gemini | `GEMINI_API_KEY`, optional `GEMINI_MODEL` |
| Ollama | `OLLAMA_HOST`, `OLLAMA_MODEL` |

Examples:

```powershell
# Windows PowerShell
$env:OPENAI_API_KEY="your-api-key"
$env:OPENAI_MODEL="gpt-4o-mini"
```

```bash
# macOS / Linux
export OPENAI_API_KEY="your-api-key"
export OPENAI_MODEL="gpt-4o-mini"
```

For Ollama local translation:

```bash
export OLLAMA_HOST="http://127.0.0.1:11434"
export OLLAMA_MODEL="gemma2"
```

## Use

Ask your agent:

```text
Translate this PDF to Korean while preserving layout.
```

Attach the PDF when you send the request. The agent should confirm the source and target language. Before using a cloud translation provider, it must ask whether you approve sending extracted PDF text to that provider.

## Output

```text
outputs/pdf_translate/<run-id>/
├── source/
│   └── original.pdf
├── translated-<target-lang>.pdf
└── translation-summary.md
```

Final generated file:

```text
translated-<target-lang>.pdf
```

## Notes

- For scanned/image-only PDFs, run OCR first or expect limited results.
