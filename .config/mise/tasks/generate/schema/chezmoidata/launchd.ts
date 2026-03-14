import * as z from '@zod/zod'

export const LaunchdSettings = z.object({
  environment: z.record(z.string(), z.union([z.string(), z.int()])),
  servicePath: z.array(z.string()),
})
