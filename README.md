# llloydretro2.github.io

Serves the academic CV at <https://llloydretro2.github.io>, used as the CV link in
PhD-application outreach emails (the outreach playbook forbids attachments on a first
email, so the CV has to be a URL).

## ⚠️ Do not edit `index.html` here

It is a **build artifact**. The maintained source is:

    <OneDrive>/简历/phd/materials/cv.html

That source carries maintenance comments that must not be published, so never copy it
here by hand. `build.sh` strips every comment.

To publish a CV change:

1. edit `materials/cv.html` in the phd working directory
2. run `./build.sh`, which re-exports the PDF and rebuilds `index.html`
3. review the diff, then commit and push

```bash
./build.sh
git diff index.html
git add index.html Haosen-Cao-CV.pdf && git commit -m "Update CV" && git push
```

`.nojekyll` stops GitHub Pages from running the files through Jekyll.

This is a **user site** (`<username>.github.io`), so GitHub Pages is on by default —
no Settings step. It replaced an earlier, unused repo of the same name on 2026-09-03.

This repo lives outside OneDrive on purpose — OneDrive syncing a `.git` directory
corrupts it.
