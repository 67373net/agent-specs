# Agent 设计与开发规范

## 地址
- 规范: https://raw.githubusercontent.com/67373net/agent-specs/main/agent.md
- 脚本: https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh

## 配置 alias 快捷命令
写入 Shell 配置文件（如 `~/.bashrc` 或 `~/.zshrc`）：
```bash
alias update-agent="curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/agent.md -o agent.md"
```
单行写入并立即生效：
```bash
echo "alias update-agent='curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/agent.md -o agent.md'" >> ~/.bashrc && source ~/.bashrc
```
配置后，在任何项目根目录执行即可更新：
```bash
update-agent
```

## 一键初始化（自动配置 alias 与下载规范）
直接执行脚本，会自动下载 `agent.md` 并写入上述 alias：
```bash
curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh | bash
```

## 发送给其他 Agent 的指令
复制以下内容发送即可：
```text
严格遵守规范：https://raw.githubusercontent.com/67373net/agent-specs/main/agent.md
并在项目根目录执行初始化：
curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh | bash
```
