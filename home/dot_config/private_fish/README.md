# Fish notes

## conf.d sequencing

The conf.d folder is loaded in alphabetical order, so files here are prefixed with a number to control the order in which they are loaded.
The ranges are as follows:

| Range | Description                             |
| ----- | --------------------------------------- |
| 00-19 | Undefined                               |
| 20-29 | Environment variables excluding `$PATH` |
| 30-39 | Finalize `$PATH`                        |
| 40-49 | Undecided (currently just atuin)        |
| 50-69 | Plugins                                 |
| 70-89 | Undefined                               |
| 90-99 | Terminal integration & late loaders     |
