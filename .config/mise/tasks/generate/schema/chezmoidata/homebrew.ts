import * as z from '@zod/zod'

export const HomebrewSettings = z
  .looseObject({
    // oh no there's a typo to fix
    forbiddden: z
      .strictObject({
        cask: z.array(z.string()).optional().meta({
          description: 'Casks to forbid installing',
          'x-tombi-array-values-order': 'ascending',
        }),
        formula: z.array(z.string()).optional().meta({
          description: 'Formuae to forbid installing',
          'x-tombi-array-values-order': 'ascending',
        }),
        linux: z.array(z.string()).optional().meta({
          description: 'Formulae to forbid installing on linux, avoid using',
          // deprecated: true,
          'x-tombi-array-values-order': 'ascending',
        }),
        tap: z.array(z.string()).optional().meta({
          description: 'Taps to forbid cloning/usage',
          'x-tombi-array-values-order': 'ascending',
        }),
      })
      .optional(),
  })
  .meta({
    description: 'homebrew config',
  })
