import * as z from '@zod/zod'
import { strictObject } from '@zod/zod'

const FontAdjust = strictObject({
  column_width: z.union([z.number(), z.string()]),
  line_height: z.union([z.number(), z.string()]),
}).meta({
  description: 'Change the size of each character cell kitty renders.',
})

const FontMain = strictObject({
  bold: z.string().nonempty(),
  bold_italic: z.string().nonempty(),
  family: z.string().nonempty(),
  italic: z.string().nonempty(),
})

const FontSymbolMap = z
  .array(
    strictObject({
      codepoints: z.array(z.string()).nonempty(),
      font: z.string().nonempty(),
    }),
  )
  .min(0)
  .meta({
    description: 'Map the specified unicode codepoints to a particular font.',
    uniqueItems: true,
  })

const Scrollback = strictObject({
  lines: z.int().min(-1).meta({
    description:
      'Number of lines of history to keep in memory for scrolling back',
  }),
  pager: strictObject({
    command: z.string().nonempty().meta({
      description: 'Program with which to view scrollback in a new window',
    }),
    history_size: z.int().min(0).max(4000).meta({
      description:
        'Separate scrollback history size, used only for browsing the scrollback buffer (in MB)',
    }),
  }).meta({
    description: 'Pager settings',
  }),
  multiplier: strictObject({
    wheel: z.number().meta({
      description: 'Modify the amount scrolled by the mouse wheel',
    }),
    touch: z.number().meta({
      description: 'Modify the amount scrolled by touchpad gestures',
    }),
  }),
})

const Terminfo = z.strictObject({
  type: z.enum(['path', 'direct', 'none']).default('path'),
  term: z.string().default('xterm-kitty'),
})
const ShellIntegration = z.array(
  z.enum([
    'enabled',
    'disabled',
    'no-rc',
    'no-cursor',
    'no-title',
    'no-cwd',
    'no-prompt-mark',
    'no-complete',
    'no-sudo',
  ]),
)
const Env = z.record(z.string().regex(/^\w+$/), z.string()).meta({
  description: 'Environment variables to set when running kitty',
})
const Advanced = z.strictObject({
  terminfo: Terminfo,
  shell_integration: ShellIntegration,
  env: Env,
})

const TitleBarColor = z.union([
  z.literal('system'),
  z.literal('background'),
  z.string().regex(/^#[0-9a-fA-F]{6}$/),
])
const LinuxSettings = z.strictObject({
  titleBarColor: TitleBarColor,
  displayServer: z.enum(['wayland', 'x11', 'auto']).default('auto').meta({
    description: 'Display server to use',
  }),
  waylandIme: z.boolean().default(true).meta({
    description: 'Enable Wayland IME support',
  }),
})
const MacOSSettings = z.strictObject({
  titleBarColor: TitleBarColor,
  optionAsAlt: z.union([z.literal(false), z.enum(['left', 'right', 'both'])]),
  hideFromTasks: z.boolean().default(false).meta({
    description: 'Hide kitty from running tasks (Opption+Tab)',
  }),
  quitWhenNoWindows: z.boolean().default(false).meta({
    description: 'Make the kitty window resizable',
  }),
  traditionalFullscreen: z.boolean().default(false).meta({
    description:
      'Use traditional fullscreen mode, which is faster but less pretty',
  }),
  showWindowTitleIn: z
    .enum(['window', 'menubar', 'all', 'none'])
    .default('all'),
  beamCursor: z.boolean().default(false).meta({
    description: 'Use a custom mousse cursor',
  }),
  colorspace: z.enum(['srgb', 'default', 'displayp3']).default('srgb'),
  windowResizable: z.boolean().default(true).meta({
    description: 'Make the kitty window resizable',
  }),
})
const OSSettings = z.strictObject({
  linux: LinuxSettings,
  macos: MacOSSettings,
})

export const KittySettings = strictObject({
  fonts: strictObject({
    adjust: FontAdjust,
    main: FontMain,
    symbol_map: FontSymbolMap,
  }),
  scrollback: Scrollback,
  advanced: Advanced,
  os: OSSettings,
})
