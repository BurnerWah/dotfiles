#!/usr/bin/env -S deno run --allow-write=schemas/generated
//MISE description="Generate a JSON schema for Eza themes"
//MISE sources=["deno.lock", ".config/mise/tasks/generate/schema/eza-theme.ts"]
//MISE outputs=["schemas/generated/eza-theme.json"]
import * as z from '@zod/zod'

const Color = z.xor([
  z.enum([
    'none',
    'None',
    'default',
    'Default',
    'black',
    'Black',
    'darkgray',
    'DarkGray',
    'red',
    'Red',
    'lightred',
    'LightRed',
    'green',
    'Green',
    'lightgreen',
    'LightGreen',
    'yellow',
    'Yellow',
    'lightyellow',
    'LightYellow',
    'blue',
    'Blue',
    'lightblue',
    'LightBlue',
    'purple',
    'Purple',
    'lightpurple',
    'LightPurple',
    'magenta',
    'Magenta',
    'lightmagenta',
    'LightMagenta',
    'cyan',
    'Cyan',
    'lightcyan',
    'LightCyan',
    'white',
    'White',
    'lightgray',
    'LightGray',
  ]),
  z.string().regex(/^#[0-9a-fA-F]{6}$/),
  z.string().regex(/^#[0-9a-fA-F]{3}$/),
  z.int().min(0).max(255),
])

const Foreground = Color.optional().meta({
  description: "The style's foreground color",
})
const Background = Color.optional().meta({
  description: "The style's background color",
})
const IsBold = z.boolean().optional().meta({
  description: 'Whether this style is bold',
})
const IsDimmed = z.boolean().optional().meta({
  description: 'Whether this style is dimmed',
})
const IsItalic = z.boolean().optional().meta({
  description: 'Whether this style is italic',
})
const IsUnderline = z.boolean().optional().meta({
  description: 'Whether this style is underlined',
})
const IsBlink = z.boolean().optional().meta({
  description: 'Whether this style is blinking',
})
const IsReverse = z.boolean().optional().meta({
  description: 'Whether this style has reverse colors',
})
const IsHidden = z.boolean().optional().meta({
  description: 'Whether this style is hidden',
})
const IsStrikethrough = z.boolean().optional().meta({
  description: 'Whether this style is struckthrough',
})
const PrefixWithReset = z.boolean().optional().meta({
  description:
    'Wether this style is always displayed starting with a reset code to clear any remaining style artifacts',
})

// Strong schema for styles that json schema can't handle
// eslint-disable-next-line @typescript-eslint/no-unused-vars
const _StyleStrong = z.union([
  z.xor([z.object({ foreground: Foreground }), z.object({ fg: Foreground })]),
  z.xor([z.object({ background: Background }), z.object({ bg: Background })]),
  z.xor([z.object({ is_bold: IsBold }), z.object({ bold: IsBold })]),
  z.xor([z.object({ is_dimmed: IsDimmed }), z.object({ dimmed: IsDimmed })]),
  z.xor([z.object({ is_italic: IsItalic }), z.object({ italic: IsItalic })]),
  z.xor([
    z.object({ is_underline: IsUnderline }),
    z.object({ underline: IsUnderline }),
  ]),
  z.xor([z.object({ is_blink: IsBlink }), z.object({ blink: IsBlink })]),
  z.xor([
    z.object({ is_reverse: IsReverse }),
    z.object({ reverse: IsReverse }),
  ]),
  z.xor([z.object({ is_hidden: IsHidden }), z.object({ hidden: IsHidden })]),
  z.xor([
    z.object({ is_strikethrough: IsStrikethrough }),
    z.object({ strikethrough: IsStrikethrough }),
  ]),
  z.xor([
    z.object({ prefix_with_reset: PrefixWithReset }),
    z.object({ prefix_reset: PrefixWithReset }),
  ]),
])
// Slightly incorrect but json schema compatible
const StyleWeak = z.strictObject({
  foreground: Foreground,
  fg: Foreground,
  background: Background,
  bg: Background,
  is_bold: IsBold,
  bold: IsBold,
  is_dimmed: IsDimmed,
  dimmed: IsDimmed,
  is_italic: IsItalic,
  italic: IsItalic,
  is_underline: IsUnderline,
  underline: IsUnderline,
  is_blink: IsBlink,
  blink: IsBlink,
  is_reverse: IsReverse,
  reverse: IsReverse,
  is_hidden: IsHidden,
  hidden: IsHidden,
  is_strikethrough: IsStrikethrough,
  strikethrough: IsStrikethrough,
  prefix_with_reset: PrefixWithReset,
  prefix_reset: PrefixWithReset,
})

const Style = z.optional(StyleWeak)

const IconStyle = z.strictObject({
  glyph: z.string().optional(),
  style: Style,
})
const FileNameStyle = z.strictObject({
  icon: IconStyle.optional(),
  filename: Style,
})

const schema = z
  .strictObject({
    colourful: z.boolean(),
    filekinds: z.strictObject({
      normal: Style,
      directory: Style,
      symlink: Style,
      pipe: Style,
      block_device: Style,
      char_device: Style,
      socket: Style,
      special: Style,
      executable: Style,
      mount_point: Style,
    }),
    perms: z.strictObject({
      user_read: Style,
      user_write: Style,
      user_execute_file: Style,
      user_execute_other: Style,
      group_read: Style,
      group_write: Style,
      group_execute: Style,
      other_read: Style,
      other_write: Style,
      other_execute: Style,
      special_user_file: Style,
      special_other: Style,
      attribute: Style,
    }),
    size: z.strictObject({
      major: Style,
      minor: Style,
      number_byte: Style,
      number_kilo: Style,
      number_mega: Style,
      number_giga: Style,
      number_huge: Style,
      unit_byte: Style,
      unit_kilo: Style,
      unit_mega: Style,
      unit_giga: Style,
      unit_huge: Style,
    }),
    users: z.strictObject({
      user_you: Style,
      user_root: Style,
      user_other: Style,
      group_yours: Style,
      group_other: Style,
      group_root: Style,
    }),
    links: z.strictObject({
      normal: Style,
      multi_link_file: Style,
    }),
    git: z.strictObject({
      new: Style,
      modified: Style,
      deleted: Style,
      renamed: Style,
      typechange: Style,
      ignored: Style,
      conflicted: Style,
    }),
    git_repo: z.strictObject({
      branch_main: Style,
      branch_other: Style,
      git_clean: Style,
      git_dirty: Style,
    }),
    security_context: z.strictObject({
      none: Style,
      selinux: z
        .strictObject({
          colon: Style,
          user: Style,
          role: Style,
          typ: Style,
          range: Style,
        })
        .optional(),
    }),
    file_type: z.strictObject({
      image: Style,
      video: Style,
      music: Style,
      lossless: Style,
      crypto: Style,
      document: Style,
      compressed: Style,
      temp: Style,
      compiled: Style,
      build: Style,
      source: Style,
    }),

    punctuation: Style,
    date: Style,
    inode: Style,
    blocks: Style,
    header: Style,
    octal: Style,
    flags: Style,

    symlink_path: Style,
    control_char: Style,
    broken_symlink: Style,
    broken_path_overlay: Style,

    filenames: z.record(z.string(), FileNameStyle),
    extensions: z.record(z.string(), FileNameStyle),
  })
  .partial()

const jsonSchema = z.toJSONSchema(
  schema.meta({
    id: 'https://json-schema.furry.codes/eza-theme.json',
    title: 'Eza Theme',
  }),
  {
    target: 'draft-2020-12',
    reused: 'ref', // Without references this schema is like 40x bigger
  },
)

// console.log(JSON.stringify(jsonSchema))
await Deno.writeTextFile(
  'schemas/generated/eza-theme.json',
  JSON.stringify(jsonSchema),
)
