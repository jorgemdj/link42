defmodule Link42Web.CallLive do
  use Link42Web, :live_view

  def render(assigns) do
    ~H"""
    <div class="p-4">
      <h2>Video Call Test</h2>
      <button id="start-call" phx-hook="VideoCall" class="bg-blue-500 text-white px-4 py-2 rounded">
        Iniciar chamada
      </button>

      <div class="mt-4 flex gap-4">
        <video id="localVideo" autoplay playsinline muted class="w-1/2 border"></video>
        <video id="remoteVideo" autoplay playsinline class="w-1/2 border"></video>
      </div>
    </div>
    """
  end
end
