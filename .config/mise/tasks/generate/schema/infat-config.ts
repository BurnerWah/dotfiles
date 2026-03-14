#!/usr/bin/env -S deno run --allow-write=schemas/generated
//MISE description="Generate a JSON schema for Infat config files"
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
  }),
  { target: 'draft-2020-12' },
)

await Deno.writeTextFile(
  'schemas/generated/infat-config.json',
  JSON.stringify(jsonSchema),
)
