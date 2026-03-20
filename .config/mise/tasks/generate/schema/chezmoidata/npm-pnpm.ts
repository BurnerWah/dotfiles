import * as z from '@zod/zod'

const Npmrc = z.record(z.string(), z.any())

export const NpmSettings = z
  .strictObject({
    core: Npmrc,
    by_os: z.record(z.string(), Npmrc),
  })
  .partial()

export const PnpmSettings = z
  .strictObject({
    core: Npmrc,
    by_os: z.record(z.string(), Npmrc),
  })
  .partial()
