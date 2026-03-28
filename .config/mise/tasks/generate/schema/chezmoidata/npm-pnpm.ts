import * as z from '@zod/zod'
import { strictObject } from '@zod/zod'

const Npmrc = z.record(z.string().nonempty(), z.any()).meta({
  'x-tombi-additional-key-label': 'setting',
})

const NpmSettings = strictObject({
  core: Npmrc,
  by_os: z.record(z.string().nonempty(), Npmrc).meta({
    'x-tombi-additional-key-label': 'os',
  }),
}).partial()

const PnpmSettings = strictObject({
  core: Npmrc,
  by_os: z.record(z.string().nonempty(), Npmrc).meta({
    'x-tombi-additional-key-label': 'os',
  }),
}).partial()

export { NpmSettings, PnpmSettings }
