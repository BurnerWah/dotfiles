import * as z from '@zod/zod'
import { record, strictObject } from '@zod/zod'
import { additionalPropsAscending } from '../shared/tombi-meta.ts'

const abbrev = z.record(z.string().nonempty(), z.string()).meta({
  description: 'Abbreviations',
  'x-tombi-table-keys-order': {
    additionalProperties: 'ascending',
  },
  'x-tombi-additional-key-label': 'name',
})
const windows_executables = z.array(z.string().nonempty()).meta({
  description: 'Windows executables to include in completions',
})
const completers = z.record(z.string().nonempty(), z.string().nonempty()).meta({
  description: 'Commands used to generate completions',
  'x-tombi-table-keys-order': {
    additionalProperties: 'ascending',
  },
  'x-tombi-additional-key-label': 'command',
})

// I cannot figure out a way to get an actual recursive schema to validate, so
// this only supports subcommands up to a point
const Subcommand = z.string().nonempty()
const Expansion = z.string()
const SubcommandAbbrevFinite = record(
  Subcommand,
  Expansion.or(
    record(
      Subcommand,
      Expansion.or(
        record(
          Subcommand,
          Expansion.or(
            record(
              Subcommand,
              Expansion.or(
                record(Subcommand, Expansion).meta(additionalPropsAscending),
              ),
            ).meta(additionalPropsAscending),
          ),
        ).meta(additionalPropsAscending),
      ),
    ).meta(additionalPropsAscending),
  ),
).meta(additionalPropsAscending)

export const ShellSettings = z
  .strictObject({
    common: z.strictObject({ abbrev, windows_executables }).partial().meta({
      description: 'Common shell settings',
    }),
    elvish: z.strictObject({ abbrev, completers }).partial().meta({
      description: 'Elvish settings',
    }),
    fish: strictObject({
      abbrev,
      wsl: strictObject({
        path_remove: z.array(z.string().nonempty()).meta({
          description: 'Patterns to remove from the PATH under WSL',
          'x-tombi-array-values-order': 'ascending',
        }),
      }).partial(),
      subcommand_abbrevs: SubcommandAbbrevFinite.meta({
        description: 'Abbreviations for subcommands',
        'x-tombi-table-keys-order': {
          additionalProperties: 'ascending',
        },
        'x-tombi-additional-key-label': 'command',
      }),
    })
      .partial()
      .meta({
        description: 'Fish settings',
      }),
    pwsh: z.strictObject({ completers }).partial().meta({
      description: 'PowerShell settings',
    }),
    zsh: strictObject({
      compsys: strictObject({
        carapace: z.array(z.string().nonempty()).meta({
          description: 'Commands to complete with Carapace',
          'x-tombi-array-values-order': 'ascending',
        }),
        aliases: z.record(z.string().nonempty(), z.string().nonempty()).meta({
          'x-tombi-table-keys-order': {
            additionalProperties: 'ascending',
          },
        }),
        unreachable: z.array(z.string().nonempty()).meta({
          'x-tombi-array-values-order': 'ascending',
        }),
      }).partial(),
      plugins: strictObject({
        load_order: z.array(z.string().nonempty()),
      }).partial(),
    })
      .partial()
      .meta({
        description: 'Zsh settings',
      }),
  })
  .partial()
  .describe('Shell settings')
