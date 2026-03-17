import js from '@eslint/js'
import json from '@eslint/json'
import { defineConfig } from 'eslint/config'
import globals from 'globals'
import tseslint from 'typescript-eslint'

export default defineConfig([
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
])
