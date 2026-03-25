#!/usr/bin/env -S deno run --allow-write=schemas/generated
//MISE description="Generate a JSON schema for Chezmoi Externals"
import * as z from '@zod/zod'
import { GoDuration } from './shared/gotypes.ts'

// This might not be fully functional right now

const RefreshPeriod = z.object({
  refreshPeriod: GoDuration.default('0').optional().meta({
    description: 'Refresh period',
  }),
})

const ArchiveCommon = z.object({
  archive: z
    .object({
      extractAppleDouble: z.boolean().default(false).optional().meta({
        description: 'Extract AppleDouble files',
      }),
    })
    .optional(),
  stripComponents: z.int().nonnegative().default(0).optional().meta({
    description:
      'Number of leading directory components to strip from archives',
  }),
  format: z
    .union([
      z.enum(['rar', 'tar', 'tar.bz2', 'tar.gz', 'tar.xz', 'tar.zst', 'zip']),
      z.string(),
    ])
    .optional()
    .describe('Format of archive'),
})

const Executable = z.object({
  executable: z.boolean().default(false).optional().meta({
    description: 'Add `executable_` attribute to file',
  }),
})

const Common = z.object({
  encrypted: z.boolean().default(false).optional().meta({
    description: 'Whether the external is encrypted',
  }),
  private: z.boolean().default(false).optional().meta({
    description: 'Add `private_` attribute to file',
  }),
  readonly: z.boolean().default(false).optional().meta({
    description: 'Add `readonly_` attribute to file',
  }),
  checksum: z
    .object({
      md5: z.hash('md5', { enc: 'hex' }).optional().meta({
        description: 'Expected MD5 checksum of data',
        deprecated: true,
      }),
      ripemd160: z.string().optional(),
      sha1: z.hash('sha1', { enc: 'hex' }).optional().meta({
        description: 'Expected SHA1 checksum of data',
        deprecated: true,
      }),
      sha256: z.hash('sha256', { enc: 'hex' }).optional().meta({
        description: 'Expected SHA256 checksum of data',
      }),
      sha384: z.hash('sha384', { enc: 'hex' }).optional().meta({
        description: 'Expected SHA384 checksum of data',
      }),
      sha512: z.hash('sha512', { enc: 'hex' }).optional().meta({
        description: 'Expected SHA512 checksum of data',
      }),
      size: z.int().nonnegative().optional().meta({
        description: 'Expected size of data',
      }),
    })
    .optional(),
  targetPath: z.string().optional().meta({
    description: 'Target path, overriding the key of the entry',
  }),
})

const ExternalURI = z.url({ protocol: /^(https?|file)$/ })
const CommonURIs = z.object({
  url: ExternalURI.optional().describe('URL of external'),
  urls: z.array(ExternalURI).optional(),
})

const Archive = z
  .object({
    type: z.literal('archive').describe('External type'),
    exact: z.boolean().default(false).optional().meta({
      description: 'Add `exact_` attribute to directories in archive',
    }),
    exclude: z.array(z.string()).optional().meta({
      description: 'Patterns to exclude from archive',
    }),
    include: z.array(z.string()).optional().meta({
      description: 'Patterns to include in archive',
    }),
  })
  .safeExtend(Common.shape)
  .safeExtend(CommonURIs.shape)
  .safeExtend(ArchiveCommon.shape)
  .safeExtend(RefreshPeriod.shape)

const ArchiveFile = z
  .object({
    type: z.literal('archive-file').describe('External type'),
    path: z.string().describe('Path to file in archive'),
  })
  .safeExtend(Common.shape)
  .safeExtend(CommonURIs.shape)
  .safeExtend(ArchiveCommon.shape)
  .safeExtend(Executable.shape)

const File = z
  .object({
    type: z.literal('file').describe('External type'),
    decompress: z.enum(['bzip2', 'gzip', 'xz', 'zstd']).optional().meta({
      description: 'Decompression for file',
    }),
    filter: z
      .object({
        command: z.string().describe('Command to filter contents'),
        args: z.array(z.string()).optional().meta({
          description: 'Extra args to command to filter contents',
        }),
      })
      .optional(),
  })
  .safeExtend(Common.shape)
  .safeExtend(CommonURIs.shape)
  .safeExtend(RefreshPeriod.shape)
  .safeExtend(Executable.shape)

const GitRepo = z
  .object({
    type: z.literal('git-repo').describe('External type'),
    clone: z
      .object({
        args: z.array(z.string()).describe('Extra args to `git clone`'),
      })
      .optional(),
    pull: z
      .object({
        args: z.array(z.string()).describe('Extra args to `git pull`'),
      })
      .optional(),
    // git urls are different from other externals
    url: z.string().optional().describe('URL of external'),
    urls: z.array(z.string()).optional(),
  })
  .safeExtend(Common.shape)

const ChezmoiExternal = z.discriminatedUnion('type', [
  Archive,
  ArchiveFile,
  File,
  GitRepo,
])

const schema = z.record(z.string(), ChezmoiExternal)

const jsonSchema = z.toJSONSchema(
  schema.meta({
    id: 'https://json-schema.furry.codes/chezmoiexternals.json',
    title: 'Chezmoi Externals',
    'x-tombi-toml-version': 'v1.1.0',
  }),
  { target: 'draft-2020-12', reused: 'ref' },
)

await Deno.writeTextFile(
  'schemas/generated/chezmoiexternals.json',
  JSON.stringify(jsonSchema),
)
