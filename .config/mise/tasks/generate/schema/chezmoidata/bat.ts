import * as z from '@zod/zod'

export const BatSettings = z
  .strictObject({
    syntax: z
      .record(
        z.string(),
        z.array(z.string()).meta({ 'x-tombi-array-values-order': 'ascending' }),
      )
      .meta({
        description: 'Mapping of syntaxes to file extensions',
        'x-tombi-table-keys-order': {
          additionalProperties: 'ascending',
        },
      }),
  })
  .meta({
    description: 'bat settings',
  })
