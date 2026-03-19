#!/usr/bin/env -S deno run --allow-write=schemas/generated
//MISE description="Generate a JSON schema for chezmoidata"
import * as z from '@zod/zod'
import { BatSettings } from './chezmoidata/bat.ts'
import { ChezmoiSettings } from './chezmoidata/chezmoi.ts'
import { HomebrewSettings } from './chezmoidata/homebrew.ts'
import { KittySettings } from './chezmoidata/kitty.ts'
import { LaunchdSettings } from './chezmoidata/launchd.ts'
import { LimaSettings } from './chezmoidata/lima.ts'
import { ShellSettings } from './chezmoidata/shell.ts'
import { SystemdSettings } from './chezmoidata/systemd.ts'

const schema = z
  .looseObject({
    settings: z
      .looseObject({
        bat: BatSettings,
        chezmoi: ChezmoiSettings,
        homebrew: HomebrewSettings,
        kitty: KittySettings,
        launchd: LaunchdSettings,
        lima: LimaSettings,
        shell: ShellSettings,
        systemd: SystemdSettings,
      })
      .partial(),
  })
  .partial()

const jsonSchema = z.toJSONSchema(
  schema.meta({
    id: 'https://json-schema.furry.codes/internal/chezmoidata.json',
    title: 'Chezmoi data',
  }),
  { target: 'draft-2020-12' },
)

// console.log(JSON.stringify(jsonSchema))
await Deno.writeTextFile(
  'schemas/generated/chezmoidata.json',
  JSON.stringify(jsonSchema),
)
