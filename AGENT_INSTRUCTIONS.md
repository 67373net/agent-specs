# Agent 快速接入指引与规范同步指南 (Agent Onboarding & Sync Guide)

> **说明**：你可以直接将本文档的内容全部复制并发送给你的任何 AI Agent（如 Cursor、Claude Code、Windsurf、Antigravity/Agy、ChatGPT 等），Agent 看到后即可自动完成环境配置与规范加载。

---

## 📋 给 Agent 的执行指令 (直接复制以下全部内容发给 Agent)

```markdown
请注意：在当前项目以及后续的所有开发任务中，你必须无条件严格遵守中央设计与开发规范。

### 1. 规范源地址 (真实地址)
- **规范仓库**: https://github.com/67373net/agent-specs
- **规范原始文件 (Raw URL)**: https://raw.githubusercontent.com/67373net/agent-specs/main/AGENTS.md

### 2. 你的第一步初始化动作
如果你拥有终端执行权限（Bash/Shell），请立即执行以下命令，为当前工作目录下载最新的规范文件，并配置全局快捷更新 alias：

```bash
# 1. 下载最新规范到当前项目根目录
curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/AGENTS.md -o AGENTS.md

# 2. 将快捷命令 update-agent 写入 shell 配置（~/.bashrc 和 ~/.zshrc），以便日后一键更新
grep -q "alias update-agent=" ~/.bashrc 2>/dev/null || echo "alias update-agent='curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/AGENTS.md -o AGENTS.md'" >> ~/.bashrc
[ -f ~/.zshrc ] && (grep -q "alias update-agent=" ~/.zshrc 2>/dev/null || echo "alias update-agent='curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/AGENTS.md -o AGENTS.md'" >> ~/.zshrc)

# 3. 针对不同 IDE 规则文件的软链接（根据你的环境按需创建，如 Cursor 或 Claude Code）
[ -d .cursor ] || ln -sf AGENTS.md .cursorrules 2>/dev/null || true
[ ! -f CLAUDE.md ] && ln -sf AGENTS.md CLAUDE.md 2>/dev/null || true
```

如果你没有终端执行权限或无法访问外部网络，请直接读取并内化以下核心规范要求：
- **工程与部署**：必须使用 `docker-compose` 部署，所有敏感信息与凭据统一在 `.env` 中管理；页面失焦/切后台时必须休眠降载（前后端开销最小化）；编译重构迅速；根目录自维护更新 `agent.md`；代码修改后在 GitHub 私密仓库保存版本；优先复用成熟开源组件。
- **对话审计与 Usage**：每次完成修改后必须统计并汇报本次消耗比例及剩余配额（格式：📊 Usage 统计：本次消耗 X% | 剩余可用 Y%），并对所有落盘历史记录脱敏。
- **UI 与样式**：无 Emoji；仅使用常用线稿图标；图标与文字二选一（仅图标时必须有 Hover Tooltip）；页面全宽无最大宽度限制；默认跟随系统主题；根目录生成 `icon.png`；搜索框为“放大镜图标+搜索”（无省略号）；表格列间距 1.28 中文字符、表头左对齐、内容完整单行显示、超宽前主动确认（换行/省略号/滚动条）、内容不足右侧留白、空内容直接留空严禁短横线。

现在，请确认你已理解上述规范，并在接下来的每一个步骤中严格执行。
```

---

## 🛠️ 各平台 Agent 适配指南备忘

| Agent / 工具类型 | 规范落盘文件名 | 快速注入方式 |
| :--- | :--- | :--- |
| **通用终端 Agent / Agy** | `AGENTS.md` | 执行 `update-agent` 或直接读取 `AGENTS.md` |
| **Cursor** | `.cursorrules` 或 `AGENTS.md` | 运行 `ln -sf AGENTS.md .cursorrules` |
| **Claude Code** | `CLAUDE.md` 或 `AGENTS.md` | 运行 `ln -sf AGENTS.md CLAUDE.md` |
| **Windsurf** | `.windsurfrules` | 运行 `ln -sf AGENTS.md .windsurfrules` |
| **Web 网页端 Agent** | 无本地文件 | 将本指引中的 Raw URL 作为首条提示词发送 |
