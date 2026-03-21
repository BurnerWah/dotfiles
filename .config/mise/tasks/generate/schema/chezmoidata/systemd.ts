import * as z from '@zod/zod'

const Environment = z.union([z.string(), z.int(), z.array(z.string())])

export const SystemdSettings = z
  .strictObject({
    environment: z.record(z.string().regex(/^\w+$/), Environment),
  })
  .partial()
  .describe('systemd settings')
