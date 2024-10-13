# Teleport Kubernetes Proxy Automation

This repository contains a script that automates logging into a Kubernetes environment using Teleport, running the Teleport proxy in the background, and providing commands to start and stop the proxy.

## Features

- Automates `tsh kube login` and `tsh proxy kube` commands.
- Runs the proxy in the background.
- Automatically sets the `KUBECONFIG` environment variable.
- Provides convenient commands to start and stop the proxy:
  - `start-tsh` to start the proxy.
  - `stop-tsh` to stop the proxy.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **Source the script in your shell configuration:**

   Add the following line to your `~/.bashrc`, `~/.zshrc`, or another shell configuration file to automatically load the `start-tsh` and `stop-tsh` functions when you open a new terminal:

   ```bash
   echo "source ~/path-to-repo/bootstrap.sh" >> ~/.bashrc  # or ~/.zshrc if you use Zsh
   ```

   Replace `~/path-to-repo/` with the actual path to where you cloned the repository.

3. **Reload your shell:**

   After adding the source line, reload your shell configuration to apply the changes:

   ```bash
   source ~/.bashrc  # or source ~/.zshrc
   ```

## Usage

### Start the Teleport proxy

Run the following command to start the Teleport proxy:

```bash
start-tsh -e production
```

- The `-e` or `--environment` flag specifies the environment (defaults to `staging` if not provided).

### Stop the Teleport proxy

Run the following command to stop the Teleport proxy:

```bash
stop-tsh
```

This will terminate the proxy and clean up the process.

## Bootstrap Script

The `bootstrap.sh` script contains the functions for starting and stopping the Teleport proxy. By sourcing this file in your shell configuration, you can access these commands globally.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.