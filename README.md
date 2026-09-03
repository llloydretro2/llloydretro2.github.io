# cv — academic CV site

Serves the academic CV at <https://llloydretro2.github.io/cv/>, used as the CV link in
PhD-application outreach emails (the outreach playbook forbids attachments on a first
email, so the CV has to be a URL).

## ⚠️ Do not edit `index.html` here

It is a **copy**. The maintained source is:

    <OneDrive>/简历/phd/materials/cv.html

To publish a CV change:

1. edit `materials/cv.html` in the phd working directory
2. re-export `materials/Haosen Cao - CV.pdf` (headless Chrome, see below)
3. copy both into this repo and push

```bash
PHD="$HOME/Library/CloudStorage/OneDrive-个人/简历/phd"
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$PHD/materials/Haosen Cao - CV.pdf" \
  "file://$PHD/materials/cv.html"
cp "$PHD/materials/cv.html" index.html
cp "$PHD/materials/Haosen Cao - CV.pdf" Haosen-Cao-CV.pdf
git add -A && git commit -m "Update CV" && git push
```

`.nojekyll` stops GitHub Pages from running the files through Jekyll.

This is a **project** repo, not a user site (`llloydretro2.github.io` was already taken),
so GitHub Pages has to be switched on by hand: Settings → Pages → Source = `main`, `/ (root)`.

This repo lives outside OneDrive on purpose — OneDrive syncing a `.git` directory
corrupts it.
