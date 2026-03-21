import * as z from '@zod/zod'

export const BatSettings = z
  .strictObject({
    syntax: z
      .record(
        z.string().nonempty(),
        z.array(z.string().nonempty()).meta({
          'x-tombi-array-values-order': 'ascending',
        }),
      )
      .meta({
        description: 'Mapping of syntaxes to file extensions',
        'x-tombi-table-keys-order': {
          additionalProperties: 'ascending',
        },
        'x-tombi-additional-key-label': 'syntax',
      }),
  })
  .meta({
    description: 'bat settings',
  })
