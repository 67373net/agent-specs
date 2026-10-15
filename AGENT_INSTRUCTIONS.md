# Agent 指令与规范同步

复制以下内容发给其他 Agent：

```markdown
在当前项目及后续开发中，严格遵守以下规范。

规范地址: https://raw.githubusercontent.com/67373net/agent-specs/main/agent.md

若有终端执行权限，请在当前项目根目录执行以下命令完成初始化与 alias 配置：

curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/sync.sh | bash

核心规范概览：
1. 工程规范：使用 docker-compose 部署；敏感信息一律走 .env 环境变量；前端非激活状态时降低前后端资源占用；编译构建保持迅速；优先复用成熟开源组件；项目建 GitHub 私密仓库并保存每次修改版本。
2. 审计规范：记录对话历史并脱敏敏感数据；根目录维护 agent.md；每次修改后汇报消耗比例与剩余比例（格式：Usage: 消耗 X% | 剩余 Y%）。
3. 界面规范：禁止 emoji，使用常见线稿图标；图标与文字二选一（仅图标时 hover 显示文字）；无最大宽度限制，占满全宽；默认跟随系统主题；根目录包含 icon.png；搜索框为“放大镜图标+搜索”无省略号；表格表头左对齐、间距 1.28 中文字符、内容单行显示、超宽主动确认（换行/省略号/滚动条）、未铺满右侧留白、空内容留空不显示短横线。
```
