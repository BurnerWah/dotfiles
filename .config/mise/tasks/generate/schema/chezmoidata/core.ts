import * as z from '@zod/zod'
import { strictObject } from '@zod/zod'

const MaybePath = z.union([z.string(), z.literal(false)])
const XdgPaths = strictObject({
  cache: z.string(),
  config: z.string(),
  data: z.string(),
  state: z.string(),
}).partial()

export const CoreChezmoiData = z
  .object({
    device: strictObject({
      chassis: z.string(),
      lima: z.boolean(),
      wsl: z.boolean(),
    }).partial(),
    devicename: z.string(),
    distro: z.string(),
    ephemeral: z.boolean(),
    headless: z.boolean(),
    mullvad: z.boolean(),
    osid: z.string(),
    paths: strictObject({
      brewPrefix: MaybePath,
      flatpak: strictObject({ system: MaybePath, user: MaybePath }).partial(),
      scoop: strictObject({ apps: MaybePath, persist: MaybePath }).partial(),
      wslHostHome: MaybePath,
      xdg: XdgPaths,
    }).partial(),
    wsl: z.boolean(),
    xdg: XdgPaths,
  })
  .partial()
