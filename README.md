# Bitdoze Utils

Welcome to the Bitdoze Utils repository! This collection of utility scripts is designed to simplify various system administration and setup tasks.

## Available Scripts

### 1. Postfix Setup Script

This script automates the process of setting up Postfix with an SMTP provider for reliable email sending.

**Usage:**
```bash
curl -sSL https://utils.bitdoze.com/scripts/postfix-setup.sh -o postfix-setup.sh
bash postfix-setup.sh
```

**Features:**
- Configures Postfix with user-provided SMTP credentials
- Sets up TLS for secure email transmission
- Configures sender address canonicalization
- Sets up the mailname file

### 2. Docker Overlay2 View Script

This script helps you view and analyze Docker overlay2 directory usage.

**Usage:**
```bash
curl -sSL https://utils.bitdoze.com/scripts/docker-overlay2-view.sh | bash
```

**Features:**
- Lists all Docker images and their associated overlay2 directories
- Shows space usage for each overlay2 directory
- Identifies unused overlay2 directories

### 3. Traefik Setup Script

This script automates the setup of Traefik as a reverse proxy for Docker containers.

**Usage:**
```bash
curl -sSL https://utils.bitdoze.com/scripts/traefik-setup.sh -o traefik-setup.sh
bash traefik-setup.sh
```

**Features:**
- Installs Docker if not already installed
- Sets up Traefik with automatic SSL certificate generation via Let's Encrypt
- Configures a secure Traefik dashboard
- Creates necessary Docker networks

## How to Use

1. Choose the script you want to run.
2. Execute the curl command provided in the script's usage section.
3. Follow the prompts to provide necessary information.
4. The script will handle the rest of the setup process.

## Safety Note

Always review scripts before running them on your system. While we strive to ensure the safety and reliability of our scripts, it's a good practice to understand what a script does before execution.

## Compatibility

These scripts are primarily designed and tested for Debian-based systems, such as Ubuntu. They may require modifications to work on other Linux distributions.

## Contribution

We welcome contributions! If you have a useful script to add or improvements to existing ones, please feel free to submit a pull request.

## Support

If you encounter any issues or have questions, please open an issue in this repository.

## License

[MIT License](LICENSE)

---

Maintained by the Bitdoze Team
