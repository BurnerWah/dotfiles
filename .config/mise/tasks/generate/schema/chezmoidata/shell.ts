import * as z from '@zod/zod'
import { strictObject } from '@zod/zod'

const abbrev = z.record(z.string(), z.string()).meta({
  description: 'Abbreviations',
  'x-tombi-table-keys-order': {
    additionalProperties: 'ascending',
  },
})
const windows_executables = z.array(z.string()).meta({
  description: 'Windows executables to include in completions',
})
const completers = z.record(z.string(), z.string()).meta({
  description: 'Commands used to generate completions',
  'x-tombi-table-keys-order': {
    additionalProperties: 'ascending',
  },
})

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
        path_remove: z.array(z.string()).meta({
          'x-tombi-array-values-order': 'ascending',
        }),
      }).partial(),
      subcommand_abbrevs: z
        .record(
          z.string(),
          z.record(z.string(), z.string()).meta({
            'x-tombi-table-keys-order': {
              additionalProperties: 'ascending',
            },
          }),
        )
        .meta({
          description: 'Abbreviations for subcommands',
          'x-tombi-table-keys-order': {
            additionalProperties: 'ascending',
          },
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
        carapace: z.array(z.string()).meta({
          description: 'Commands to complete with Carapace',
          'x-tombi-array-values-order': 'ascending',
        }),
        aliases: z.record(z.string(), z.string()).meta({
          'x-tombi-table-keys-order': {
            additionalProperties: 'ascending',
          },
        }),
        unreachable: z.array(z.string()).meta({
          'x-tombi-array-values-order': 'ascending',
        }),
      }).partial(),
      plugins: strictObject({
        load_order: z.array(z.string()),
      }).partial(),
    })
      .partial()
      .meta({
        description: 'Zsh settings',
      }),
  })
  .partial()
  .describe('Shell settings')
