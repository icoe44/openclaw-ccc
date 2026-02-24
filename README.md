# OpenClaw Command Center (ccc)

一个交互式的 OpenClaw 命令行面板，让管理 OpenClaw 服务变得简单直观。

## 🎯 功能特点

- 🎨 **彩色交互式菜单** - 清晰的分层菜单，一目了然
- ⚡️ **快捷命令** - 一个命令访问所有常用功能
- 📋 **三级菜单结构** - 主菜单 + 子菜单，组织清晰
- 🔧 **覆盖全面** - 网关管理、模型管理、定时任务、插件、记忆管理
- 💾 **执行反馈** - 命令执行后自动返回菜单

## 🚀 快速开始

### 安装

```bash
# 克隆到本地
git clone https://github.com/YOUR_USERNAME/openclaw-ccc.git
cd openclaw-ccc

# 安装到系统路径
chmod +x ccc.sh
sudo ln -sf $(pwd)/ccc.sh /usr/local/bin/ccc
```

### 使用

```bash
ccc
```

就这么简单！

## 📖 菜单结构

### 一级菜单（23 个选项）

| 序号 | 功能 | 命令 |
|------|------|------|
| 1 | 初始化 OpenClaw | `openclaw setup` |
| 2 | 引导配置 | `openclaw onboard` |
| 3 | 修改配置 | `openclaw configure` |
| 4-8 | 服务管理 | `openclaw gateway start/stop/restart/status/logs` |
| 9-13 | 网关管理 | `openclaw gateway start/stop/restart/status/run` |
| 14-15 | 状态与日志 | `openclaw status/logs` |
| 16-20 | 模型管理 | `openclaw models list/status/set/scan/auth` |
| 21 | 定时任务管理 | 进入子菜单 |
| 22 | 插件管理 | 进入子菜单 |
| 23 | 记忆管理 | 进入子菜单 |

### 二级菜单

#### 2.1 定时任务管理
- 列出任务：`openclaw cron list`
- 添加任务：`openclaw cron add`
- 删除任务：`openclaw cron rm <id>`
- 手动运行：`openclaw cron run <id>`

#### 2.2 插件管理
- 列出插件：`openclaw plugins list`
- 启用插件：`openclaw plugins enable <id>`
- 禁用插件：`openclaw plugins disable <id>`

#### 2.3 记忆管理
- 查看状态：`openclaw memory status`
- 重建索引：`openclaw memory index`
- 语义搜索：`openclaw memory search "<query>"`

## 📸 截图

```
========================================
   欢迎使用 OpenClaw 面板
========================================

1. 初始化 OpenClaw          openclaw setup
2. 引导配置                 openclaw onboard
3. 修改配置                 openclaw configure
4. 启动服务                 openclaw gateway start
5. 停止服务                 openclaw gateway stop
...
```

## 🔧 自定义

### 修改颜色

编辑 `ccc.sh` 顶部的颜色定义：

```bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
```

### 添加新命令

在 `main_loop()` 函数中添加新的 case 分支：

```bash
24) run_command "openclaw your-new-command" ;;
```

## 📁 项目结构

```
openclaw-ccc/
├── ccc.sh              # 主脚本
├── README.md           # 本文件
├── LICENSE             # MIT License
└── screenshots/        # 截图目录（可选）
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

1. Fork 本项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

- [OpenClaw](https://github.com/openclaw/openclaw) - 强大的 AI 助手框架
- 社区贡献者们

## 📬 联系方式

- 项目地址：https://github.com/YOUR_USERNAME/openclaw-ccc
- 问题反馈：https://github.com/YOUR_USERNAME/openclaw-ccc/issues

---

**享受更便捷的 OpenClaw 管理体验！** 🎉
