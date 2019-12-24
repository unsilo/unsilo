use Mix.Config

config :nerves_firmware_ssh,
  authorized_keys: [
    File.read!(Path.join(System.user_home!(), ".ssh/id_rsa.pub"))
  ]

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"
config :nerves, :erlinit, mount: "ttyAMA0"

config :shoehorn,
  init: [:nerves_runtime, :vintage_net],
  app: Mix.Project.config()[:app]

config :logger, backends: [RingLogger]

import_config "target.secret.exs"

# import_config "#{Mix.target()}.exs"
