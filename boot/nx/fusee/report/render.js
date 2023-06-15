#!/usr/bin/env node
var markdownpdf = require("markdown-pdf"), fs = require("fs")

// Markdown rendering options:
options = {
  remarkable: { breaks: false },
  paperFormat: 'Letter',
}

fs.createReadStream("fusee_gelee.md")
  .pipe(markdownpdf(options))
  .pipe(fs.createWriteStream("fusee_gelee.pdf"))

