# Dynatrace Agent Installation Utility

This repository contains a Python-based utility to automate the installation of Dynatrace OneAgent on both Linux and Windows servers. The utility uses configuration files to define server details and Dynatrace environment information, making it easy to scale the installation process.

## Project Structure

```
├── Main.py                     # Entry point for running the utility
├── install
|   └── __init__.py             # class initilization file
│   └── installAgent.py         # Core logic for agent installation
├── configurations
│   ├── dynatrace_details.json  # Contains Dynatrace environment details
│   └── hosts.json              # Defines server details for agent installation
├── logs                        # Directory for log files
├── requirements.txt            # Required Python dependencies
└── README.md                   # Project documentation
```

## Prerequisites

### On machine from where code will be executed

1. **Python Installation (Required)**
   - Install Python 3.8 or higher.

2. **Virtual Environment Setup (Optional)**
   - Create a virtual environment to isolate dependencies:
     ```bash
     python -m venv venv
     source venv/bin/activate  # For Linux/Mac
     venv\Scripts\activate   # For Windows
     ```

3. **Install Dependencies (Required)**
   - Use `pip` to install the required libraries:
     ```bash
     pip install -r requirements.txt
     ```

### Target Machines

4. **For Linux Hosts where oneagent should be installed**
    - Port 22 (unidirectional) should be open to accept the SSH connection and excecute the shell commands.
      Source : ActiveGate Server/From where we will deploy the pyhton code.  Destination: App/Web/DB Servers
    - If custom path is needed to install DT One Agent, plz provide the necessary execution permissions to folder where agent should be provided using chmod - R 777 <Directory> command.

5. **For Windows Hosts where oneagent should be installed**
    - Port 5985 (unidirectional) port should be open
    - Also, configure the `winrm` on windows hosts using following command in command prompt
    ```
        winrm quickconfig
    ```
    - Click "yes" when prompted, this will allow windows machine to accept the connection to execute Powershell command

## Configuration Files

1. **`dynatrace_details.json`**
   - Defines Dynatrace environment details such as environment ID, API token, and agent versions.
   ```json
   {
     "env_id": "DT-env-id",
     "pass_token": "DT-pass-token",
     "linux_agent_version": "Dynatrace-OneAgent-Linux-version.sh",
     "windows_agent_version": "Dynatrace-OneAgent-Windows-version.exe"
   }
   ```

2. **`hosts.json`**
   - Lists the servers where the agents will be installed.
   - Required Fields - Server-Name, OS, IP, Username, Password, mode
   ```json
   {
     "hosts": [
       {
         "name": "server-name",
         "os": "Ubuntu",
         "ip": "server-ip",
         "username": "your-username",
         "password": "your-password",
         "host_group": "host-group",
         "mode": "fullstack",
         "server_type": "APP",
         "custom_install_path": "optional-path",
         "custom_log_path": "optional-path"
       }
     ]
   }
   ```

## Usage

1. **Run the Utility**
   - Execute the main script to start the installation process:
     ```bash
     python Main.py
     ```

2. **Logs**
   - Check the `logs` directory for detailed logs of the installation process.

## How It Works

1. **Initialization**
   - Reads configuration files to load Dynatrace environment and server details.
   - Sets up logging for the process.

2. **Agent Download**
   - Downloads the appropriate agent installer based on the operating system (Linux or Windows).

3. **Agent Installation**
   - Executes the installation commands on the target servers using:
     - `paramiko` for Linux servers (SSH).
     - `pywinrm` for Windows servers (WinRM).

## Dependencies

The utility requires the following Python libraries:

- `paramiko`
- `pywinrm`

Install all dependencies using the `requirements.txt` file.
