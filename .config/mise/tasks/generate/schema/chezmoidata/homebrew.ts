import * as z from '@zod/zod'

export const HomebrewSettings = z
  .looseObject({
    forbidden: z
      .strictObject({
        cask: z.array(z.string()).optional(),
        formula: z.array(z.string()).optional(),
        linux: z.array(z.string()).optional(),
        tap: z.array(z.string()).optional(),
      })
      .optional(),
  })
  .meta({
    description: 'homebrew config',
  })
