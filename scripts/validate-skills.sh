#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill="$root/wow-pdf-translate-skill/SKILL.md"

test -f "$skill"
grep -q '^---$' "$skill"
grep -q '^name: wow-pdf-translate-skill$' "$skill"
grep -q '^description: ' "$skill"
test -f "$root/wow-pdf-translate-skill/scripts/pdf_translate.py"
test -f "$root/wow-pdf-translate-skill/scripts/validate_outputs.py"
test -f "$root/wow-pdf-translate-skill/references/engines.md"
test -f "$root/wow-pdf-translate-skill/references/services.md"
python -m py_compile "$root/wow-pdf-translate-skill/scripts/pdf_translate.py" "$root/wow-pdf-translate-skill/scripts/validate_outputs.py"
echo "skill validation ok"
