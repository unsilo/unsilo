defmodule Device.Disks do
  require Logger

  use GenServer

  def start_link(_args) do
    children = [
      # Starts a worker by calling: Device.Worker.start_link(arg)
      # {Device.Worker, arg}
    ]

    Logger.info("trying to mount device")

    :os.cmd(
      'mount.exfat -o defaults,uid=65534,gid=65534,dmask=027,fmask=027 /dev/sda1 /root/unsilo'
    )
    |> IO.inspect(label: "the mount results")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Device.Disks.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def init(opts) do
    {:ok, opts}
  end
end
