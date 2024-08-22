# DevOps Tools for Neovim

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Introduction

**DevOps Tools for Neovim** is a toolbox plugin designed to streamline your DevOps workflow directly from your Neovim editor. This plugin provides integrations for essential DevOps tools such as Docker, Helm, Terraform, and Kubectl, making it easier to manage your infrastructure as code without leaving your editor.

## Features

- **Docker Integration**: Manage your Docker containers.
- **Helm Support**: Execute Helm commands, manage releases, and work with Helm charts.
- **Terraform Integration**: Format, validate, and deploy your Terraform scripts effortlessly.
- **Kubectl Integration**: Interact with your Kubernetes clusters, manage pods, deployments, and services directly from Neovim.

## Requirements

Before using this plugin, ensure you have the following installed:

- **Docker** 
- **Helm**
- **Terraform**
- **Kubectl**
- **FZF**

Make sure these tools are accessible in your system's PATH.

## Installation

You can install the plugin using your preferred Neovim plugin manager. Here’s how you can do it with some popular options:

### Using `vim-plug`

1. Add the following line to your `init.vim` or `init.lua`:

    ```vim
    Plug 'azratul/devops-tools.nvim'
    ```

2. Install the plugin with the command:

    ```vim
    :PlugInstall
    ```

### Using `packer.nvim`

1. Add the plugin to your packer setup:

    ```lua
    use 'azratul/devops-tools.nvim'
    ```

2. Run `:PackerSync` to install it.

## Usage

Once installed, you can access the features of the plugin through various Neovim commands:

- **Docker Commands**:
    - `:DockerPs` - List all running containers.
    - `:DockerImages` - List all Docker images.
    - `:DockerRun <image>` - Run a Docker container from an image.

- **Helm Commands**:
    - `:HelmInstall <chart>` - Install a Helm chart.
    - `:HelmTemplate <release> <chart>` - Render chart templates locally and display the output.
    - `:HelmUpgrade <release> <chart>` - Upgrade a Helm release.

- **Terraform Commands**:
    - `:TerraformInit` - Initialize a Terraform project.
    - `:TerraformPlan` - Generate and display an execution plan.
    - `:TerraformApply` - Apply the changes required to reach the desired state.

- **Kubectl Commands**:
    - `:KubectlGet <resource> <name>` - List the resource in the current namespace.
    - `:KubectlDescribe <resource> <name>` - Describe a specific resource.
    - `:KubectlLogs` - Displays a list of all available pods using FZF, allowing you to select a pod to view its logs.

> Kubectl: 🛠️ WIP. Some commands were added, but it's unfinished
