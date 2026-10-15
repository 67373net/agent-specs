# Agent 设计与开发规范

统一维护各环境 Agent 使用的工程与界面规范。

## 资源地址
- 仓库地址: https://github.com/67373net/agent-specs
- 规范文件: https://raw.githubusercontent.com/67373net/agent-specs/main/agent.md
- 指引文件: https://raw.githubusercontent.com/67373net/agent-specs/main/AGENT_INSTRUCTIONS.md
- 同步脚本: https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh

## 使用方法

### 1. 初始化并写入 alias
在目标项目根目录执行：
```bash
curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh | bash
```

### 2. 后续更新
在已配置 alias 的终端直接执行：
```bash
update-agent
```

### 3. 分发给其他 Agent
将 AGENT_INSTRUCTIONS.md 中的内容直接发送给目标 Agent。
