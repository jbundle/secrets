# Secrets handling

Secret handling is simple and secure.

All unencrypted secrets are stored in /run/secrets while in use.

This directory is always a ephemeral ram drive:

- For Linux /run is available by default
- For MacOS, read the mac shell script
  - /run is linked to the System/Volumes/Data/opt/run drive
- For Windows, use the ImDisk program to create a virtual disk with a temp dir, mounted at /run
  - Remember to enable symbolic link conversion in git (install) and in registry
