import * as z from '@zod/zod'

const DockerContext = z.strictObject({
  instance: z.string(),
  socket: z.string(),
  description: z.string(),
})

const PodmanConnection = z.strictObject({
  instance: z.string(),
  socket: z.string(),
})

export const LimaSettings = z
  .strictObject({
    tmpfiles: z.strictObject({
      shared: z.array(z.string()).meta({
        description: 'Shared tmpfiles for lima',
        'x-tombi-array-values-order': 'ascending',
      }),
    }),
    docker_context: z.array(DockerContext),
    podman_connection: z.array(PodmanConnection),
  })
  .partial()
