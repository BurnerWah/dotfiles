#!/usr/bin/env -S deno run --allow-write=schemas/generated
//MISE description="Generate a JSON schema for Chezmoi's config file"
import * as z from '@zod/zod'
import { strictObject } from '@zod/zod'
import { GoDuration } from './shared/gotypes.ts'

// This is mostly finished but could probably still use some work

const AutoBool = z.union([z.boolean(), z.literal('auto')])
const Environment = z.record(z.string(), z.string())
const Command = z.string().describe('CLI command')
const ExtraArgs = z.array(z.string()).min(1).meta({
  description: 'Extra args to the command',
})
const Suffix = z.string().describe('Suffix appended to encrypted files')
const Symmetric = z.boolean().default(false).meta({
  description: 'Use symmetric encryption',
})
const EntryType = z
  .enum([
    'all',
    'always',
    'dirs',
    'files',
    'remove',
    'scripts',
    'symlinks',
    'encrypted',
    'externals',
    'templates',
  ])
  .describe('Entry type')
const Hook = strictObject({
  post: z
    .strictObject({
      command: z.array(z.string()).describe('Command to run after command'),
      args: ExtraArgs,
    })
    .describe('Post hook')
    .partial(),
  pre: z
    .strictObject({
      command: z.array(z.string()).describe('Command to run before command'),
      args: ExtraArgs,
    })
    .describe('Pre hook')
    .partial(),
}).partial()
const Interpreter = strictObject({
  command: z.string().describe('Interpreter command'),
  args: ExtraArgs,
}).partial()
const Prompt = z.boolean().default(false).describe('Prompt for password')

const AgeConfig = strictObject({
  command: Command.default('age'),
  args: ExtraArgs,
  identities: z.array(z.string()).describe('age identity files'),
  identity: z.string().describe('age identity file'),
  passphrase: z.boolean().default(false).meta({
    description: 'Use age passphrase instead of identity',
  }),
  recipient: z.string().describe('age recipient'),
  recipients: z.array(z.string()).describe('age recipients'),
  recipientsFile: z.string().describe('age recipients file'),
  recipientsFiles: z.array(z.string()).describe('age recipients files'),
  suffix: Suffix.default('.age'),
  symmetric: Symmetric,
}).describe('Age configuration')

const AwsSecretsManagerConfig = strictObject({
  profile: z.string().describe('AWS shared profile name'),
  region: z.string().describe('AWS region'),
}).describe('AWS Secrets Manager configuration')

const AzureKeyVaultConfig = strictObject({
  defaultVault: z.string().describe('default vault name'),
}).describe('Azure Key Vault configuration')

const BitwardenConfig = strictObject({
  command: Command.default('bw'),
  unlock: z.boolean().default(false).meta({
    description: 'Whether to unlock the Bitwarden CLI',
  }),
}).describe('Official Bitwarden CLI configuration')

const BitwardenSecretsConfig = strictObject({
  command: Command.default('bws'),
}).describe('Bitwarden secrets configuration')

const DashlaneConfig = strictObject({
  command: Command.default('dcli'),
  args: ExtraArgs,
}).describe('Dashlane CLI configuration')

const DiffConfig = strictObject({
  command: z.string().describe('External diff command'),
  args: ExtraArgs,
  exclude: z.array(EntryType).describe('Entry types to exclude from diffs'),
  pager: z.string().describe('Diff-specific pager'),
  reverse: z.boolean().default(false).meta({
    description: 'Reverse order of arguments to diff',
  }),
  scriptContents: z.boolean().default(true).meta({
    description: 'Show script contents',
  }),
})

const DopplerConfig = strictObject({
  command: Command.default('doppler'),
  args: ExtraArgs,
  config: z.string().meta({
    description: 'Default config (aka environment) if none is specified',
  }),
  project: z.string().describe('Default project name if none is specified'),
}).describe('Doppler CLI configuration')

const EditConfig = strictObject({
  apply: z.boolean().default(false).describe('Apply changes on exit'),
  command: Command,
  args: ExtraArgs,
  hardlink: z.boolean().default(true).meta({
    description: 'Invoke editor with a hardlink to the source file',
  }),
  minDuration: GoDuration.default('1s').meta({
    description: 'Minimum duration for edit command',
  }),
  watch: z.boolean().default(false).meta({
    description: 'Automatically apply changes when files are saved',
  }),
})

const EJsonConfig = strictObject({
  key: z.string().meta({
    description:
      'The private key to use for decryption, will supersede using the keyDir if set',
  }),
  keyDir: z.string().describe('Path to directory containing private keys'),
})

const GitConfig = strictObject({
  autoAdd: z.boolean().default(false).meta({
    description: 'Add changes to the source state after any change',
  }),
  autoCommit: z.boolean().default(false).meta({
    description: 'Commit changes to the source state after any change',
  }),
  autoPush: z.boolean().default(false).meta({
    description: 'Push changes to the source state after any change',
  }),
  command: Command.default('git'),
  commitMessageTemplate: z.string().describe('Commit message template'),
  commitMessageTemplateFile: z.string().meta({
    description: 'Commit message template file (relative to source directory)',
  }),
  lfs: z.boolean().default(false).describe('Run git lfs pull after cloning'),
})

const GopassConfig = strictObject({
  command: Command.default('gopass'),
}).describe('Gopass configuration')

const GPGConfig = strictObject({
  command: Command.default('gpg'),
  args: ExtraArgs,
  recipient: z.string().describe('GPG recipient'),
  recipients: z.array(z.string()).describe('GPG recipients'),
  suffix: Suffix.default('.gpg'),
  symmetric: Symmetric.default(false),
}).describe('GPG configuration')

const HCPVaultSecretsConfig = strictObject({
  applicationName: z.string().meta({
    description: 'Default application name if none is specified',
  }),
  command: Command.default('vlt'),
  args: ExtraArgs,
  organizationId: z.string().meta({
    description: 'Default organization ID if none is specified',
  }),
  projectId: z.string().meta({
    description: 'Default project ID if none is specified',
  }),
}).describe('HCP Vault Secrets configuration')

const KeepassxcConfig = strictObject({
  command: Command.default('keepassxc-cli'),
  args: ExtraArgs,
  database: z.string().describe('KeePassXC database'),
  mode: z.enum(['cache-password', 'open']).default('cache-password').meta({
    description: 'KeePassXC mode',
  }),
  prompt: Prompt,
}).describe('KeePassXC configuration')

const KeeperConfig = strictObject({
  command: Command.default('keeper'),
  args: ExtraArgs,
}).describe('Keeper configuration')

const LastpassConfig = strictObject({
  commaand: Command.default('lpass'),
}).describe('LastPass configuration')

const OnepasswordConfig = strictObject({
  cache: z.boolean().default(true).meta({
    description: 'Enable optional caching provided by `op`',
  }),
  command: Command.default('op'),
  mode: z.enum(['account', 'connect', 'service']).default('account').meta({
    description: '1Password mode',
  }),
  prompt: Prompt.describe(
    'Prompt for sign-in when no valid session is available',
  ),
}).describe('1Password CLI configuration')

const OnepasswordSDKConfig = strictObject({
  token: z.string().describe('1Password SDK token'),
  tokenEnvVar: z.string().describe('1Password SDK token environment variable'),
}).describe('1Password SDK configuration')

const PassConfig = strictObject({
  command: Command.default('pass'),
}).describe('Pass configuration')

const PassholeConfig = strictObject({
  commnd: Command.default('ph'),
  args: ExtraArgs,
  prompt: Prompt,
}).describe('Passhole configuration')

const PinentryConfig = strictObject({
  command: z.string().describe('Pinentry CLI command'),
  args: ExtraArgs,
  options: z.array(z.string()).describe('Pinentry options'),
})

const RBWConfig = strictObject({
  command: Command.default('rbw'),
}).describe('Unofficial Bitwarden CLI configuration')

const SecretConfig = strictObject({
  command: z.string().describe('Secret CLI command'),
  args: ExtraArgs,
})

const StatusConfig = strictObject({
  exclude: z.array(EntryType).describe('Entry types to exclude from status'),
  pathStyle: z
    .enum(['absolute', 'relative', 'source-absolute', 'source-relative'])
    .default('relative')
    .describe('Path style for status output'),
})

const Textconv = strictObject({
  pattern: z.string().describe('Target path pattern to match'),
  command: z.string().describe('Command to transform contents'),
  args: ExtraArgs,
})

const schema = z
  .object({
    cacheDir: z.string().describe('Cache directory'),
    color: AutoBool.default('auto').describe('Colorize output'),
    data: z.any().meta({
      // TODO Make this a reference to the chezmoidata schema
      description: 'Template data',
    }),
    destDir: z.string().describe('Destination directory'),
    encryption: z.enum(['age', 'gpg', 'transparent']).meta({
      description: 'Encryption type',
    }),
    env: Environment.describe(
      'Extra environment variables for scripts and commands',
    ),
    format: z.enum(['json', 'yaml']).default('json').meta({
      description: 'Format for data output',
    }),
    interactive: z.boolean().default(false).describe('Prompt for all changes'),
    mode: z.enum(['file', 'symlink']).default('file').meta({
      description: 'Mode in target dir',
    }),
    pager: z.string().describe('Pager for CLI command'),
    pagerArgs: z.array(z.string()).describe('Extra args to the pager command'),
    persistentState: z.string().meta({
      description: 'Location of the persistent state file',
    }),
    progress: z.boolean().default(false).describe('Show progress'),
    scriptEnv: Environment.describe(
      'Extra environment variables for scripts, hooks, and commands',
    ),
    scriptTempDir: z.string().describe('Temporary directory for scripts'),
    sourceDir: z.string().describe('Source directory'),
    tempDir: z.string().describe('Temporary directory'),
    umask: z.int().describe('Umask'),
    useBuiltinAge: AutoBool.default('auto').describe(
      'Use builtin age if `age` command is not found in `$PATH`',
    ),
    useBuiltinGit: AutoBool.default('auto').describe(
      'Use builtin git if `git` command is not found in `$PATH`',
    ),
    verbose: z.boolean().default(false).describe('Verbose output'),
    workingTree: z.string().describe('Working tree'),

    add: strictObject({
      encrypt: z.boolean().default(false).describe('Encrypt by default'),
      secrets: z.enum(['ignore', 'warning', 'error']).default('warning').meta({
        description: 'Action when secrets are found when adding files',
      }),
      templateSymlinks: z.boolean().default(false).meta({
        description: 'Template symlinks to source and home dirs',
      }),
    }).partial(),
    age: AgeConfig.partial(),
    awsSecretsManager: AwsSecretsManagerConfig.partial(),
    azureKeyVault: AzureKeyVaultConfig.partial(),
    bitwarden: BitwardenConfig.partial(),
    bitwardenSecrets: BitwardenSecretsConfig.partial(),
    cd: strictObject({
      command: z.string().describe('Shell to run in cd command'),
      args: ExtraArgs,
    }).partial(),
    completion: strictObject({
      custom: z.boolean().default(false).meta({
        description: 'Enable custom shell completions',
      }),
    }).partial(),
    dashlane: DashlaneConfig.partial(),
    diff: DiffConfig.partial(),
    doppler: DopplerConfig.partial(),
    edit: EditConfig.partial(),
    ejson: EJsonConfig.partial(),
    git: GitConfig.partial(),
    gitHub: strictObject({
      refreshPeriod: GoDuration.default('1m').meta({
        description: 'Minimum duration between identical GitHub API requests',
      }),
    }).partial(),
    gopass: GopassConfig.partial(),
    gpg: GPGConfig.partial(),
    hcpVaultSecrets: HCPVaultSecretsConfig.partial(),
    hooks: z.record(z.string(), Hook).describe('Chezmoi Hooks configuration'),
    interpreters: z.record(z.string(), Interpreter).meta({
      description: 'Windows script configuration',
    }),
    keepassxc: KeepassxcConfig.partial(),
    keeper: KeeperConfig.partial(),
    lastpass: LastpassConfig.partial(),
    merge: strictObject({
      command: z.string().describe('Three-way merge CLI command'),
      args: ExtraArgs,
    }).partial(),
    onepassword: OnepasswordConfig.partial(),
    onepasswordSDK: OnepasswordSDKConfig.partial(),
    pass: PassConfig.partial(),
    passhole: PassholeConfig.partial(),
    pinentry: PinentryConfig.partial(),
    rbw: RBWConfig.partial(),
    secret: SecretConfig.partial(),
    status: StatusConfig.partial(),
    template: strictObject({
      options: z.array(z.string()).describe('Template options'),
    }).partial(),
    textconv: z.array(Textconv).describe('Textconv configuration'),
    update: strictObject({
      apply: z.boolean().default(true).describe('Apply after pulling'),
      command: z.string().describe('Update command'),
      args: ExtraArgs,
      recurseSubmodules: z.boolean().default(true).meta({
        description: 'Update submodules recursively',
      }),
    }).partial(),
    vault: z
      .strictObject({
        command: Command.default('vault'),
      })
      .partial()
      .describe('Hashicorp Vault configuration'),
    verify: strictObject({
      exclude: z.array(EntryType).meta({
        description: 'Entry types to exclude from verification',
      }),
    }).partial(),
    warnings: strictObject({
      configFileTemplateHasChanged: z.boolean().default(true).meta({
        description: 'Warn when the config file template has changed',
      }),
    }).partial(),
  })
  .partial()

const jsonSchema = z.toJSONSchema(
  schema.meta({
    id: 'https://json-schema.furry.codes/chezmoiconfig.json',
    title: 'Chezmoi Config',
  }),
  { target: 'draft-2020-12' },
)

await Deno.writeTextFile(
  'schemas/generated/chezmoiconfig.json',
  JSON.stringify(jsonSchema),
)
