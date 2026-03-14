import * as z from '@zod/zod'

const Environment = z.union([z.string(), z.int(), z.array(z.string())])

export const SystemdSettings = z
  .looseObject({
    environment: z.record(z.string(), Environment),
  })
  .partial()
  .describe('systemd settings')
