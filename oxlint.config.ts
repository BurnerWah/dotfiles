import globals from 'globals'
import { defineConfig } from 'oxlint'

export default defineConfig({
  ignorePatterns: [
    'home/**/symlink_*',
    'home/**/remove_*',
    'home/**/modify_*.json',
    'home/**/modify_*.jsonc',
    'home/**/modify_*.yml',
    'home/**/modify_*.yaml',
    'schemas/generated/',
    'schemas/vendor/',
  ],
  plugins: ['eslint', 'typescript', 'unicorn', 'oxc', 'import', 'promise'],
  categories: {
    suspicious: 'warn',
    perf: 'warn',
    restriction: 'warn',
    style: 'warn',
  },
  rules: {
    'oxc/no-rest-spread-properties': 'allow',
    'import/no-relative-parent-imports': 'allow',
    'sort-keys': 'off',
    'id-length': ['warn', { exceptions: ['z'] }],
    'import/no-namespace': ['warn', { ignore: ['@zod/zod'] }],
    'no-magic-numbers': 'allow',
    'no-ternary': 'allow',
    'capitalized-comments': 'allow',
    'import/no-named-export': 'allow',
    'sort-imports': 'allow', // I haven't got import sorting figured out yet
    'import/prefer-default-export': 'allow',
  },
  overrides: [
    {
      files: ['.config/mise/tasks/**/*.{js,mjs,cjs,ts,mts,cts}'],
      globals: Object.fromEntries(
        Object.entries(globals.denoBuiltin).map(([name, writable]) => [
          name,
          writable ? 'readonly' : 'writable',
        ]),
      ),
    },
    {
      files: ['*.config.ts', '*.config.mts'],
      rules: {
        'import/no-default-export': 'allow',
      },
    },
  ],
})
