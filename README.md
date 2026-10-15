# Universal Agent Specs (通用 AI Agent 设计与开发规范)

本项目为分布在多台机器、多个环境下的各类 AI Agent（Cursor、Claude Code、Windsurf、Antigravity/Agy、网页端 Agent 等）提供**单点维护、高频更新、开箱即用**的统一开发与 UI 设计规范。

## 🌐 真实访问地址
- **GitHub 仓库**: [https://github.com/67373net/agent-specs](https://github.com/67373net/agent-specs)
- **规范正文 (Raw Markdown)**: [https://raw.githubusercontent.com/67373net/agent-specs/main/AGENTS.md](https://raw.githubusercontent.com/67373net/agent-specs/main/AGENTS.md)
- **一键安装脚本**: [https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh](https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh)
- **Agent 对接指令文档**: [AGENT_INSTRUCTIONS.md](AGENT_INSTRUCTIONS.md)

---

## 🚀 极简用法 (Quick Start)

### 方式 1：一键安装与配置 alias（推荐）
在任何项目的根目录下，直接在终端执行：
```bash
curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh | bash
```
该命令会自动：
1. 下载最新的 `AGENTS.md` 到当前项目目录。
2. 自动软链接为 `.cursorrules` 与 `CLAUDE.md`（按需适配各大 IDE）。
3. 自动在你的 `~/.bashrc` 和 `~/.zshrc` 中写入 `update-agent` 命令。

### 方式 2：使用 alias 手动更新
配置完成后，以后在任何机器的任何项目目录下，只要敲：
```bash
update-agent
```
即可秒级拉取 GitHub 上最新的 `AGENTS.md` 规范。

### 方式 3：直接发给 Agent 的提示词
详见 [AGENT_INSTRUCTIONS.md](AGENT_INSTRUCTIONS.md)。只需把里面的提示词块直接复制粘贴给 Agent 即可。

---

## 📑 规范包含的核心内容概览
- **工程与部署**：`docker-compose` 编排、全敏感配置 `.env` 隔离、页面非激活/切后台时休眠优化（降低前后端资源占用）、高速增量构建与缓存、自维护更新根目录 `agent.md`、GitHub 私密仓库版本保存、开源项目与组件优先复用。
- **审计与治理**：会话全记录与敏感信息严格脱敏、每次任务汇报 Usage 消耗比例与剩余额度（`📊 Usage 统计：本次消耗 X% | 剩余可用 Y%`）。
- **UI 与视觉规范**：
  - 严禁 Emoji（除非专门指定）；统一使用线稿图标 (Outline Icons)。
  - 图标与文字二选一（纯图标必须有 Hover Tooltip）。
  - 全宽无最大宽度限制 (`no max-width`)，默认占满浏览器。
  - 默认跟随操作系统主题 (`prefers-color-scheme`)。
  - 根目录生成 `icon.png`。
  - 搜索框默认样式：线稿放大镜图标 + “搜索”二字（无省略号）。
  - 列表与表格：表头左对齐、列间距 `1.28` 个中文字符、单行完整显示、宽度不足主动向用户确认（换行/省略号/滚动条）、未铺满右侧留白、空内容直接留空（严禁短横线 `-`）。
