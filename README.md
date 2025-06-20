# Jenkins Configuration-as-Code (JCasC) Example

[![Build status](https://badge.buildkite.com/acefe7b66579afe6cb1f2bfcdae157ec1083b900f34a5ac490.svg)](https://buildkite.com/cnunciato/cnunciato-jenkins-jcasc-example)

This repo shows how to configure a Jenkins cluster using [Jenkins Configuration as Code (JCasC)](https://buildkite.com/blog/automating-jenkins-with-jcasc-configuration-as-code). It includes a full setup with a Jenkins controller, inbound build agents, automated plugin installation,  and a sample application pipeline that fetches and builds this repository, all defined in code and managed with Docker and Docker Compose. 

There's even a public [Buildkite](https://buildkite.com/) pipeline ☝️ that tests the whole thing end to end. ✨

It's a companion repo to the Buildkite blog ["Automating Jenkins with Configuration as Code (JCasC)"](https://buildkite.com/blog/automating-jenkins-with-jcasc-configuration-as-code). 

## What's included

- **`jenkins.yaml`**: The core JCasC configuration file defining security realms, authorization, agents, tools, credentials, and jobs
- **`plugins.txt`**: A list of pinned Jenkins plugins for consistent, repeatable installations
- **Docker Compose setup**: Complete orchestration of a Jenkins controller and two self-registering build agents
- **Sample Node.js application**: Demonstrates a working multi-branch pipeline with automated builds and tests
- **Agent auto-registration**: Custom shell script that automatically retrieves agent secrets and connects to the controller

## Prerequisites

- Docker and Docker Compose installed and running
- Optionally, a GitHub account with a personal access token (with `repo` scope for private repositories)

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/cnunciato/jenkins-jcasc-example.git
   cd jenkins-jcasc-example
   ```

2. (Optional) Set up GitHub credentials as environment variables for private repository access:
   ```bash
   export GITHUB_USERNAME="${your_username}"
   export GITHUB_TOKEN="${your_token}"
   ```

3. Start Jenkins with Docker Compose:
   ```bash
   docker-compose up
   ```

4. Access Jenkins at http://localhost:8080 with the default credentials:
   - Username: `admin`
   - Password: `admin`

5. Explore the pre-configured pipeline job `jenkins-jcasc-example` that automatically builds and tests the sample Node.js application

## Customizing the configuration

### Admin and agent credentials

You can customize the admin credentials by setting environment variables before starting:

```bash
export JENKINS_ADMIN_USERNAME=myadmin
export JENKINS_ADMIN_PASSWORD=mysecurepassword
export JENKINS_AGENT_USERNAME=myagent
export JENKINS_AGENT_PASSWORD=myagentpassword
docker-compose up
```

See the `docker-compose.yml` file for details.

### Adding plugins

To add more plugins, edit `plugins.txt` and include the plugin name with a specific version:

```
your-plugin-name:1.2.3  # or :latest
```

Plugin versions can be found in the [Jenkins Plugins Index](https://plugins.jenkins.io/).

### Modifying the Jenkins configuration

Edit `jenkins.yaml` to modify:

- Security settings and user permissions
- Agent configurations
- Tool installations (Node.js, Maven, etc.)
- Credential definitions
- Job configurations

After making changes, restart with `docker-compose down && docker-compose up`.

## Repository Structure

```
.
├── app/                      # Sample Node.js application
│   ├── index.js             # Simple Express server
│   ├── index.test.js        # Jest tests
│   ├── package-lock.json    # NPM dependencies
│   └── Jenkinsfile          # Pipeline definition
├── Dockerfile.controller    # Jenkins controller container setup
├── Dockerfile.agent         # Jenkins agent container setup  
├── docker-compose.yml       # Service orchestration
├── agent.sh                 # Agent self-registration script
├── jenkins.yaml             # 👈 Main JCasC configuration
└── plugins.txt              # 👈 Jenkins plugins list
```

## Key Features Demonstrated

- **Hands-free Jenkins cluster setup**: No click-ops required
- **Agent-only execution**: The controller delegates all builds to inbound agents
- **Role-based security**: Separate `admin` and `agent` users with appropriate permissions
- **Multi-branch pipelines**: Builds all branches and pull requests
- **Agent self-registration**: Agents automatically connect without manual secret copying
- **Version-pinned plugins**: Ensures consistent, reproducible environments

## Learn More

For more information about Jenkins Configuration as Code:

- [Blog post: "Automating Jenkins with Configuration as Code (JCasC)"](https://buildkite.com/blog/automating-jenkins-with-jcasc-configuration-as-code)
- [The JCasC project](https://www.jenkins.io/projects/jcasc/)
- [Configuration as Code in the Jenkins Handbook](https://www.jenkins.io/doc/book/managing/casc/)
