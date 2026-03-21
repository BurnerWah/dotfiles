import * as z from '@zod/zod'

export const HomebrewSettings = z
  .strictObject({
    forbidden: z
      .strictObject({
        cask: z.array(z.string().nonempty()).meta({
          description: 'Casks to forbid installing',
          'x-tombi-array-values-order': 'ascending',
        }),
        formula: z.array(z.string().nonempty()).meta({
          description: 'Formuae to forbid installing',
          'x-tombi-array-values-order': 'ascending',
        }),
        linux: z.array(z.string().nonempty()).meta({
          description: 'Formulae to forbid installing on linux, avoid using',
          // deprecated: true,
          'x-tombi-array-values-order': 'ascending',
        }),
        tap: z.array(z.string().regex(/^[^/]+\/[^/]+$/)).meta({
          description: 'Taps to forbid cloning/usage',
          'x-tombi-array-values-order': 'ascending',
        }),
      })
      .partial()
      .optional(),
  })
  .meta({
    description: 'homebrew config',
  })
