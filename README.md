## React 组件库搭建指南

- [React 组件库搭建指南（一）：项目初始化](https://github.com/worldzhao/blog/issues/3)
- [React 组件库搭建指南（二）：开发调试](https://github.com/worldzhao/blog/issues/4)
- [React 组件库搭建指南（三）：编译打包](https://github.com/worldzhao/blog/issues/5)
- [React 组件库搭建指南（四）：单元测试](https://github.com/worldzhao/blog/issues/6)
- [React 组件库搭建指南（五）：标准化发布流程](https://github.com/worldzhao/blog/issues/7)

[🚀 在线预览](https://worldzhao.github.io/react-ui-library-tutorial)

🚆 本地预览

```bash
git clone git@github.com:worldzhao/react-ui-library-tutorial.git
cd react-ui-library-tutorial
pnpm install
pnpm start
```

按顺序执行完命令后，即可在 localhost:3000 端口看到以下内容：

![preview](https://raw.githubusercontent.com/worldzhao/blog/master/images/rc-lib-v1-1.jpg)

## 概览

本系列文章主要包含以下内容：

- 项目初始化: 组件库前期开发准备工作。`eslint`/`commit lint`/`typescript`等等；
- 开发阶段: 使用 [dumi](https://d.umijs.org/zh-CN) 进行开发调试以及文档编写；
- 打包阶段: 输出~~`umd`~~/`cjs`/`esm`产物并支持按需加载；
- 组件测试: 使用`@testing-library/react`及其相关生态进行组件测试；
- 发布 npm: 编写脚本完成发布或直接使用 [np](https://www.npmjs.com/package/np) 发布；
- 部署文档站点: 使用 Github Pages 以及 Github Actions 完成文档站点自动部署。

## Project Overview: Automating React UI Library Deployment Using Docker, Kubernetes, and Jenkins

This project automates the CI/CD pipeline for an internal React UI library to streamline the process of synchronizing, building, and deploying new updates across multiple tools. The solution leverages Docker, Kubernetes, and Jenkins to create a robust deployment pipeline that reduces manual intervention and ensures the library is always up-to-date with the latest changes.

The internal React UI library is designed to provide ready-made components that can be used by various development teams within the company. The primary challenge is ensuring that updates made by the UI library developers are seamlessly integrated into the tools without issues like broken components, missing dependencies, or miscommunication between teams.

### Key Features:
- **Containerization with Docker**: Provides a consistent runtime environment.
- **Kubernetes Orchestration**: Manages deployment and scaling.
- **CI/CD Pipeline with Jenkins**: Automates build and deployment processes.
- **Security and Resource Management**: Optimizes resource usage and monitors application health.
- **Documentation and Visualization**: Ensures transparency and ease of use.

### Technologies Used:
- Node.js
- Docker
- Kubernetes
- Jenkins
- GitHub
- Docker Hub

### Benefits of the Solution:
- Automated Process
- Consistency
- Scalability
- Reduced Downtime

The Automated UI Library improves collaboration between UI library developers and tool developers, automates error-prone processes, and ensures reliable deployment of components.

### Objectives
- **Automate Component Development**: CI/CD pipelines for quick updates.
- **Automate Update Triggers**: Webhooks for continuous synchronization.
- **Enhance Component Reliability**: Automated testing for quality assurance.
- **Documentation and Resources**: Comprehensive usage guidelines.
- **Visualize the Workflow**: Diagrams for understanding architecture.

This project aims to streamline the process of maintaining an internal React UI library for our development team.
