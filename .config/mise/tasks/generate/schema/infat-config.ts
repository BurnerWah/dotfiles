#!/usr/bin/env -S deno run --allow-write=schemas/generated
//MISE description="Generate a JSON schema for Infat config files"
//MISE sources=["deno.lock", ".config/mise/tasks/generate/schema/infat-config.ts"]
//MISE outputs=["schemas/generated/infat-config.json"]
import * as z from '@zod/zod'

const InfatTable = z.record(z.string(), z.string()).optional()

const schema = z.object({
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
})

const jsonSchema = z.toJSONSchema(
  schema.meta({
    id: 'https://json-schema.furry.codes/infat-config.json',
    title: 'Infat Config',
    'x-tombi-toml-version': 'v1.0.0',
  }),
  { target: 'draft-2020-12' },
)

await Deno.writeTextFile(
  'schemas/generated/infat-config.json',
  JSON.stringify(jsonSchema),
)
