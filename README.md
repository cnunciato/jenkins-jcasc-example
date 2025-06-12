# Jenkins Configuration as Code Example

This repository demonstrates how to configure Jenkins using the Configuration as Code (JCasC) approach. It includes a complete setup with a Jenkins controller, multiple build agents, and a sample application pipeline—all defined entirely in code.

## What's Included

- **`jenkins.yaml`**: The core configuration file for Jenkins, defining security, agents, tools, credentials, and jobs
- **Docker Compose setup**: orchestrates a Jenkins controller and two build agents
- **Sample application**: A simple Node.js app with a Jenkinsfile to demonstrate the pipeline

## Prerequisites

- Docker and Docker Compose
- Git
- GitHub account with a personal access token (with repo scope)

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/cnunciato/jenkins-jcasc-example.git
   cd jenkins-jcasc-example
   ```

2. Set up GitHub credentials as environment variables:
   ```bash
   export GITHUB_USERNAME=your_github_username
   export GITHUB_TOKEN=your_personal_access_token
   ```

3. Start Jenkins with Docker Compose:
   ```bash
   docker-compose up
   ```

4. Access Jenkins at http://localhost:8080 with default credentials:
   - Username: admin
   - Password: admin

## Custom Configuration

You can customize the default admin credentials by setting environment variables:

```bash
export ADMIN_USERNAME=custom_username
export ADMIN_PASSWORD=secure_password
export ADMIN_EMAIL=your_email@example.com
```

## Structure

- `jenkins.yaml`: Main JCasC configuration file
- `docker-compose.yml`: Defines the Jenkins controller and agents
- `plugins.txt`: List of Jenkins plugins to install
- `app/`: Sample application with Jenkinsfile

## Learn More

For more information about Jenkins Configuration as Code:
- [JCasC Plugin Documentation](https://github.com/jenkinsci/configuration-as-code-plugin)
- [Jenkins Configuration as Code: A Practical Guide](https://www.jenkins.io/projects/jcasc/)