#!/usr/bin/env -S node --import jiti/register
//MISE description="Generate a JSON schema for Infat config files"
//MISE sources=["pnpm-lock.yaml", ".config/mise/tasks/generate/schema/infat-config.ts"]
//MISE outputs=["schemas/generated/infat-config.json"]
import fs from 'node:fs/promises'
import * as z from 'zod'

const InfatTable = z.record(z.string(), z.string()).optional(),
  schema = z.object({
    extensions: InfatTable.meta({
      'x-tombi-table-keys-order': {
        additionalProperties: 'ascending',
      },
    }),
    schemes: InfatTable.meta({
      'x-tombi-table-keys-order': {
        additionalProperties: 'ascending',
      },
    }),
    types: InfatTable.meta({
      'x-tombi-table-keys-order': {
        additionalProperties: 'ascending',
      },
    }),
  }),
  jsonSchema = z.toJSONSchema(
    schema.meta({
      // id: 'https://json-schema.furry.codes/infat-config.json',
      title: 'Infat Config',
      'x-tombi-toml-version': 'v1.0.0',
    }),
    { target: 'draft-2020-12' },
  )

await fs.writeFile(
  'schemas/generated/infat-config.json',
  JSON.stringify(jsonSchema),
)
