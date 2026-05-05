#!/bin/bash
# Convert all PDF/HTML in corpus to clean markdown.
# Output: <subdir>/md/<basename>.md alongside originals.
#
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 LdesignMedia
# See LICENSE for details. This script is MIT-licensed; the rest of the
# repository follows the license schedule documented in LICENSE.
set -e
ROOT="/Users/luukverhoeven/TOOLS/cyberbeveiligingswet-nis2"
cd "$ROOT"

clean_pandoc_md() {
  python3 - "$1" <<'PY'
import re, sys
p = sys.argv[1]
with open(p, 'r', encoding='utf-8') as f:
    t = f.read()
t = re.sub(r'^:{3,}.*$\n?', '', t, flags=re.MULTILINE)
t = re.sub(r'\[([^\[\]]*?)\]\{[^}]*\}', r'\1', t)
t = re.sub(r'\{#[^}]*\}', '', t)
t = re.sub(r'\{\.[^}]*\}', '', t)
t = re.sub(r'\\\(([^)]*)\\\)', r'(\1)', t)
def flatten(m):
    block=m.group(0); rows=[]; cur=None
    for line in block.split('\n'):
        if re.match(r'^\+[-=+]+\+\s*$', line):
            if cur is not None: rows.append([' '.join(c).strip() for c in cur])
            cur=[[] for _ in range(line.count('+')-1)]; continue
        if line.startswith('|') and cur is not None:
            parts=line.strip('|').split('|')
            if len(parts)==len(cur):
                for i,pp in enumerate(parts):
                    s=pp.strip()
                    if s: cur[i].append(s)
    out=[]
    for r in rows:
        if len(r)==2 and r[0]: out.append(f"**{r[0]}** {r[1]}".strip())
        elif len(r)==1: out.append(r[0])
        else: out.append(' | '.join(r))
    return '\n\n'.join(out)+'\n'
t=re.compile(r'(?:^\+[-=+]+\+\s*\n(?:\|.*\n|\+[-=+]+\+\s*\n)+)', re.MULTILINE).sub(flatten, t)
t=re.sub(r'^-{20,}\s*$', '', t, flags=re.MULTILINE)
t=re.sub(r'\n{3,}', '\n\n', t)
with open(p, 'w', encoding='utf-8') as f: f.write(t)
PY
}

convert_html() {
  local src="$1" dst="$2"
  pandoc -f html -t markdown-raw_html-native_divs-native_spans --wrap=none "$src" -o "$dst"
  clean_pandoc_md "$dst"
}

convert_pdf() {
  local src="$1" dst="$2"
  pdftotext -layout -nopgbrk "$src" - | python3 -c "
import sys, re
t = sys.stdin.read()
t = re.sub(r'[ \t]+\n', '\n', t)
t = re.sub(r'\n{3,}', '\n\n', t)
sys.stdout.write(t)
" > "$dst"
}

for dir in eu-directives eu-implementing-regulation enisa-guidance nl-wetsvoorstel nl-amvb-consultatie nl-amvb-consultatie-wwke ncsc-nl eu-cooperation-group; do
  [ -d "$dir" ] || continue
  mkdir -p "$dir/md"
  echo "=== $dir ==="
  for f in "$dir"/*.pdf; do
    [ -f "$f" ] || continue
    out="$dir/md/$(basename "$f" .pdf).md"
    echo "  pdf -> $(basename "$out")"
    convert_pdf "$f" "$out"
  done
  for f in "$dir"/*.html; do
    [ -f "$f" ] || continue
    out="$dir/md/$(basename "$f" .html).md"
    echo "  html -> $(basename "$out")"
    convert_html "$f" "$out"
  done
done

# Root-level PDFs
mkdir -p md
for f in *.pdf; do
  [ -f "$f" ] || continue
  out="md/$(basename "$f" .pdf).md"
  echo "root pdf -> $out"
  convert_pdf "$f" "$out"
done

echo "DONE"
