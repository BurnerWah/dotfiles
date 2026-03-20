import * as z from '@zod/zod'

// This matches some invalid durations but it's accurate enough for now
// A more precise one should only match negative durations that have a time included,
// but within the context of this project those don't really make sense anyways
// Note - 0 is the only number on its own that is accepted
export const GoDuration = z
  .string()
  .regex(/^(-?(\d+h)?(\d+m)?(\d+s)?(\d+ms)?(\d+[uµ]s)?(\d+ns)?|0)$/)
