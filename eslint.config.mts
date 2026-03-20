import js from '@eslint/js'
import json from '@eslint/json'
import jsonschema from 'eslint-plugin-json-schema-validator'
import yml from 'eslint-plugin-yml'
import { defineConfig } from 'eslint/config'
import globals from 'globals'
import tseslint from 'typescript-eslint'

export default defineConfig([
  {
    ignores: [
      'home/**/symlink_*',
      'home/**/remove_*',
      'home/**/modify_*.json',
      'home/**/modify_*.jsonc',
      'home/**/modify_*.yml',
      'home/**/modify_*.yaml',
      'schemas/generated/*',
      'schemas/vendor/*',
      'playbooks/*.yml',
      'playbooks/*.yaml',
    ],
  },
  {
    files: ['**/*.{js,mjs,cjs,ts,mts,cts}'],
    plugins: { js },
    extends: ['js/recommended'],
  },
  tseslint.configs.recommended,
  {
    files: ['.config/mise/tasks/**/*.{js,mjs,cjs,ts,mts,cts}'],
    languageOptions: {
      globals: { ...globals.denoBuiltin },
    },
  },
  {
    files: ['**/*.json'],
    plugins: { json },
    language: 'json/json',
    extends: ['json/recommended'],
  },
  {
    files: ['**/*.jsonc', '.vscode/*.json', '.vscode/*.code-snippets'],
    plugins: { json },
    language: 'json/jsonc',
    extends: ['json/recommended'],
  },
  {
    files: [
      'deno.jsonc',
      'biome.jsonc',
      '.vscode/*.json',
      '.vscode/*.code-snippets',
      'home/dot_config/*_fastfetch/config.jsonc',
    ],
    plugins: { json },
    language: 'json/jsonc',
    languageOptions: {
      allowTrailingCommas: true,
    },
    extends: ['json/recommended'],
  },
  {
    files: ['*.yaml', '**/*.yaml', '*.yml', '**/*.yml'],
    plugins: { yml, jsonschema },
    language: 'yml/yaml',
    extends: ['yml/recommended', 'yml/prettier'],
    rules: {
      'jsonschema/no-invalid': [
        'warn',
        {
          schemas: [
            {
              // This has tons of parsing problems due to anchor usage
              fileMatch: [
                'home/dot_config/*_carapace/*_specs/*.yaml',
                'home/dot_config/*_carapace/*_overlays/*.yaml',
              ],
              schema: 'https://carapace.sh/schemas/command.json',
            },
            {
              fileMatch: [
                'home/**/.chezmoidata/*.{yml,yaml,json,jsonc}',
                'home/**/.chezmoidata.{yml,yaml,json,jsonc}',
              ],
              schema: 'schemas/generated/chezmoidata.json',
            },
            {
              fileMatch: ['home/dot_config/*_eza/*theme.yml'],
              schema: 'schemas/generated/eza-theme.json',
            },
            {
              fileMatch: ['home/dot_config/*_lima/private_*/lima.yaml'],
              schema: 'schemas/vendor/lima.json',
            },
          ],
        },
      ],
    },
  },
])
