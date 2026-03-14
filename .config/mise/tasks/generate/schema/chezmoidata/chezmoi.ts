import * as z from '@zod/zod'

export const ChezmoiSettings = z.looseObject({
  ignored: z
    .looseObject({
      dotfiles: z.array(z.string()).optional(),
      home: z.array(z.string()).optional(),
    })
    .optional(),
})
