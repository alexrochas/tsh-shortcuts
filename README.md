# Teleport Kubernetes Proxy Automation

This repository contains scripts that automate logging into a Kubernetes environment using Teleport, running the Teleport proxy in the background, and providing commands to start and stop the proxy. Additionally, it includes a prompt indicator to signal when the Teleport proxy is running.

## Features

- Automates `tsh kube login` and `tsh proxy kube` commands.
- Runs the proxy in the background.
- Automatically sets the `KUBECONFIG` environment variable.
- Provides convenient commands to start and stop the proxy:
  - `start-tsh` to start the proxy.
  - `stop-tsh` to stop the proxy.
- Updates the shell prompt to include a green `(tsh)` indicator when the proxy is running.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/alexrochas/tsh-shortcuts.git
   cd your-repo-name
   ```

2. **Source the startup and prompt scripts in your shell configuration:**

   Depending on whether you're using `bash` or `zsh`, add the appropriate source commands to your shell configuration files.

### For `bash` Users

1. **Source the `bootstrap.sh` script** to automatically load the `start-tsh` and `stop-tsh` functions:

   ```bash
   echo "source ~/path-to-repo/bootstrap.sh" >> ~/.bashrc
   ```

   Replace `~/path-to-repo/` with the actual path where you cloned the repository.

2. **Source the `prompt-bash.sh` script** to update your prompt with a green `(tsh)` indicator when the proxy is running:

   ```bash
   echo "source ~/path-to-repo/prompt-bash.sh" >> ~/.bashrc
   ```

3. **Reload your shell** to apply the changes:

   ```bash
   source ~/.bashrc
   ```

### For `zsh` Users

1. **Source the `bootstrap.sh` script** to automatically load the `start-tsh` and `stop-tsh` functions:

   ```bash
   echo "source ~/path-to-repo/bootstrap.sh" >> ~/.zshrc
   ```

2. **Source the `prompt-zsh.sh` script** to update your prompt with a green `(tsh)` indicator when the proxy is running:

   ```bash
   echo "source ~/path-to-repo/prompt-zsh.sh" >> ~/.zshrc
   ```

3. **Reload your shell** to apply the changes:

   ```bash
   source ~/.zshrc
   ```

## Usage

### Start the Teleport proxy

Run the following command to start the Teleport proxy:

```bash
start-tsh -e production
```

- The `-e` or `--environment` flag specifies the environment (defaults to `staging` if not provided).

Once the proxy is running, you will see the green `(tsh)` indicator in your command prompt, signifying that the Teleport proxy is active.

### Stop the Teleport proxy

Run the following command to stop the Teleport proxy:

```bash
stop-tsh
```

This will terminate the proxy, and the green `(tsh)` indicator will disappear from your prompt.

## Bootstrap and Prompt Scripts

- The `bootstrap.sh` script contains the functions for starting and stopping the Teleport proxy.
- The `prompt-bash.sh` and `prompt-zsh.sh` scripts customize your shell prompt to include the `(tsh)` indicator when the proxy is running. Each script is tailored for its respective shell (`bash` or `zsh`).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
