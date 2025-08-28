# Link42

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

**Lightweight, scalable, and fault-tolerant — leveraging the BEAM's power to enable real-time, serverless connections between nodes.**

Link42 is a Phoenix-based platform for creating secure, fault-tolerant WebRTC connections between nodes using Elixir's powerful concurrency model and the BEAM virtual machine's distributed capabilities.

## Features

- **Real-time Video & Audio Communication**: P2P connections using WebRTC with fallback mechanisms
- **Fault Tolerance**: Built on the BEAM VM for high availability and self-healing capabilities
- **Distributed Architecture**: Easily scale horizontally across multiple nodes
- **Low Latency**: Optimized for real-time communication with minimal overhead
- **Secure**: End-to-end encrypted connections between peers
- **LiveView Integration**: Seamless UI updates with Phoenix LiveView

## Demo

Visit our [live demo](http://localhost:4000/call) to test the communication capabilities.

## Getting Started

### Prerequisites

- Elixir 1.15+
- Erlang/OTP 26+
- Node.js 18+ (for asset compilation)
- PostgreSQL (optional)

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/jorgemdj/link42.git
   cd link42
   ```

2. Install dependencies
   ```bash
   mix setup
   ```

3. Start the Phoenix server
   ```bash
   mix phx.server
   ```

4. Visit [`localhost:4000/call`](http://localhost:4000/call) from your browser

## Architecture

Link42 leverages the following key components:

- **Phoenix LiveView**: For real-time UI without writing JavaScript
- **WebRTC**: For peer-to-peer audio/video connections
- **Phoenix Channels**: For signaling and fallback communication
- **OTP**: For supervision trees and fault tolerance
- **BEAM Distribution**: For horizontal scaling across nodes

```
┌───────────────┐     ┌───────────────┐
│ Phoenix Node 1│◄────►Phoenix Node 2 │
└───────┬───────┘     └───────┬───────┘
        │                     │
        ▼                     ▼
┌───────────────┐     ┌───────────────┐
│   Browser 1   │◄────►   Browser 2   │
│  (WebRTC P2P) │     │  (WebRTC P2P) │
└───────────────┘     └───────────────┘
```

## Development

### Running Without Database

For quick testing without PostgreSQL:

1. Comment out the Repo reference in `lib/link42/application.ex`
2. Start the server
   ```bash
   mix phx.server
   ```

### Custom Hooks

Link42 uses LiveView hooks to initialize WebRTC connections:

```javascript
// In assets/js/hooks/video_call.js
let VideoCall = {
  mounted() {
    // WebRTC initialization code
  }
};
```

## Deployment

Link42 can be deployed as a distributed system:

1. Build a release
   ```bash
   MIX_ENV=prod mix release
   ```

2. Deploy to multiple nodes with a distributed configuration

3. Set up proper DNS and load balancing

Check the [Phoenix deployment guides](https://hexdocs.pm/phoenix/deployment.html) for more information.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Learn More

* [Phoenix Framework](https://www.phoenixframework.org/)
* [WebRTC](https://webrtc.org/)
* [Elixir](https://elixir-lang.org/)
* [BEAM VM](https://www.erlang.org/blog/beam-compiler/)
* [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html)
