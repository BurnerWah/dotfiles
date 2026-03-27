#!/usr/bin/env -S deno run --allow-write=schemas/generated
//MISE description="Generate a JSON schema for chezmoidata"
//MISE sources=["deno.lock", ".config/mise/tasks/generate/schema/chezmoidata/*.ts", ".config/mise/tasks/generate/schema/shared/*.ts"]
//MISE outputs=["schemas/generated/chezmoidata.json"]
import * as z from '@zod/zod'
import { BatSettings } from './bat.ts'
import { ChezmoiSettings } from './chezmoi.ts'
import { CoreChezmoiData } from './core.ts'
import { HomebrewSettings } from './homebrew.ts'
import { KittySettings } from './kitty.ts'
import { LaunchdSettings } from './launchd.ts'
import { LimaSettings } from './lima.ts'
import { NpmSettings, PnpmSettings } from './npm-pnpm.ts'
import { ShellSettings } from './shell.ts'
import { SystemdSettings } from './systemd.ts'

const schema = z
  .strictObject({
    settings: z
      .strictObject({
        bat: BatSettings,
        chezmoi: ChezmoiSettings,
        homebrew: HomebrewSettings,
        kitty: KittySettings,
        launchd: LaunchdSettings,
        lima: LimaSettings,
        npm: NpmSettings,
        pnpm: PnpmSettings,
        shell: ShellSettings,
        systemd: SystemdSettings,
      })
      .partial(),
  })
  .safeExtend(CoreChezmoiData.shape)
  .partial()

const jsonSchema = z.toJSONSchema(
  schema.meta({
    id: 'https://json-schema.furry.codes/internal/chezmoidata.json',
    title: 'Chezmoi data',
    'x-tombi-toml-version': 'v1.1.0',
  }),
  { target: 'draft-2020-12' },
)

// console.log(JSON.stringify(jsonSchema))
await Deno.writeTextFile(
  'schemas/generated/chezmoidata.json',
  JSON.stringify(jsonSchema),
)
