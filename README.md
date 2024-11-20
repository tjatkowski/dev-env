# Development Container Environment

A containerized development environment that provides a consistent setup across different machines. This container includes common development tools and programming languages (Node.js, Python, Ruby) ready to use.

## Purpose

- Provides isolated development environment
- Ensures consistent development setup across team members
- Eliminates "it works on my machine" problems
- Keeps your host system clean
- Allows easy setup on new machines

## Included Tools & Languages

- Node.js 22 (via nvm)
- Python 3 with pip
- Ruby with dev tools
- Git
- Essential build tools
- Vim
- Zsh

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone this repository:
  ```bash
  git clone [repository-url]
  cd [repository-name]
  ```

2. Create workspace structure:
  ```bash
  mkdir -p workspace/projects
  ```

3. Build and start the container:
  ```bash
  docker-compose up -d --build
  ```

## Usage

1. Enter the container:
  ```bash
  docker-compose exec devenv bash
  ```

2. Your files will be available in:
  - Container: `/workspace`
  - Host: `./workspace`

3. Place your projects in:
  - Container: `/workspace/projects`
  - Host: `./workspace/projects`

## Volume Mapping

- `./workspace:/workspace` - Your development files
- `~/.gitconfig:/root/.gitconfig` - Git configuration (read-only)
- `~/.ssh:/root/.ssh` - SSH keys for Git operations (read-only)

## Ports

- 3000 - Node.js applications
- 4000 - Ruby applications
- 8000 - Python applications

## Stopping the Container

```bash
docker-compose down
