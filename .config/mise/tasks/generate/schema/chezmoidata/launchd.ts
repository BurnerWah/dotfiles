import * as z from '@zod/zod'

export const LaunchdSettings = z.strictObject({
  environment: z.record(
    z.string().regex(/^\w+$/),
    z.union([z.string(), z.int()]),
  ),
  servicePath: z.array(z.string()),
})
