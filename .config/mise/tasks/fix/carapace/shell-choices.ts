#!/usr/bin/env -S deno run --allow-env --allow-run=sd
//MISE dir="{{cwd}}"
//MISE description="Fix carapace choice templates for shells"
//MISE tools={sd="latest"}
//USAGE arg "<files>" var=#true
//USAGE flag "--preview"

const SD_REPLACEMENT_TEMPLATE = `{{- if ne .chezmoi.os "windows" -}}
$1
{{- end }}`

const command = new Deno.Command('sd', {
  args: [
    ...(Deno.env.get('usage_preview') ? ['--preview'] : []),
    '--flags=m',
    '--across',
    '\\A([\\w+-]+/(?:fish|bash|zsh)@bridge)$',
    SD_REPLACEMENT_TEMPLATE,
    ...Deno.args.filter((arg) => arg !== '--preview'),
  ],
  stdin: 'null',
  stdout: 'inherit',
})
const child = command.spawn()
const status = await child.status
Deno.exit(status.code)
