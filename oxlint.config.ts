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
})
