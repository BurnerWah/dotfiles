#!/usr/bin/env -S deno run --allow-env --allow-run
//MISE dir="{{cwd}}"
//MISE description="Fix carapace choice templates for shells"
//USAGE arg "<files>" var=#true
//USAGE flag "-p --preview"

const SD_REPLACEMENT_TEMPLATE = `{{- if ne .chezmoi.os "windows" -}}
$1
{{- end }}`

const files = Deno.env.get('usage_files') ?? ''

const command = new Deno.Command('sd', {
  args: [
    ...(Deno.env.get('usage_preview') ? ['--preview'] : []),
    '--flags=m',
    '--across',
    '\\A([\\w+-]+/(?:fish|bash|zsh)@bridge)$',
    SD_REPLACEMENT_TEMPLATE,
    ...files.split(' '),
  ],
  stdin: 'null',
  stdout: 'inherit',
})
const child = command.spawn()
const status = await child.status
Deno.exit(status.code)
