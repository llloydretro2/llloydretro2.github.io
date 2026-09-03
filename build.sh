#!/usr/bin/env bash
# Rebuild the published CV from the maintained source.
#
# index.html is a BUILD ARTIFACT. Never edit it here.
# The source is <OneDrive>/简历/phd/materials/cv.html, which carries extensive
# maintenance comments (required by that project's CLAUDE.md rule 4). Those comments
# must NOT ship: they record earlier factual corrections, the CV's rewrite history, and
# internal notes that read badly out of context. This script strips every HTML comment.
set -euo pipefail
PHD="$HOME/Library/CloudStorage/OneDrive-个人/简历/phd"
SITE="$(cd "$(dirname "$0")" && pwd)"

"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$PHD/materials/Haosen Cao - CV.pdf" \
  "file://$PHD/materials/cv.html" 2>/dev/null

python3 - "$PHD/materials/cv.html" "$SITE/index.html" <<'PY'
import re, sys, io
src, dst = sys.argv[1], sys.argv[2]
h = io.open(src, encoding='utf-8').read()
out = re.sub(r'<!--.*?-->', '', h, flags=re.S)
out = re.sub(r'\n{3,}', '\n\n', out)
io.open(dst, 'w', encoding='utf-8').write(out)
n = len(re.findall(r'<!--.*?-->', h, flags=re.S))
assert '<!--' not in out, "comment survived the strip"
print(f"stripped {n} comments -> {dst}")
PY

cp "$PHD/materials/Haosen Cao - CV.pdf" "$SITE/Haosen-Cao-CV.pdf"
echo "built. review, then: git add -A && git commit && git push"
