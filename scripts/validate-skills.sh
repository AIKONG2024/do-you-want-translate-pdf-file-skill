#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill="$root/do-you-want-translate-pdf-file-skill/SKILL.md"

test -f "$skill"
grep -q '^---$' "$skill"
grep -q '^name: do-you-want-translate-pdf-file-skill$' "$skill"
grep -q '^description: ' "$skill"
test -f "$root/do-you-want-translate-pdf-file-skill/scripts/pdf_translate.py"
test -f "$root/do-you-want-translate-pdf-file-skill/scripts/validate_outputs.py"
test -f "$root/do-you-want-translate-pdf-file-skill/references/engines.md"
test -f "$root/do-you-want-translate-pdf-file-skill/references/services.md"
python -m py_compile "$root/do-you-want-translate-pdf-file-skill/scripts/pdf_translate.py" "$root/do-you-want-translate-pdf-file-skill/scripts/validate_outputs.py"
echo "skill validation ok"
