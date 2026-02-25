# OpenClaw Command Center (ccc)

> 🦞 **让 OpenClaw 管理像逛淘宝一样简单**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)](https://www.gnu.org/software/bash/)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Plugin-orange.svg)](https://openclaw.ai)

---

## 📖 项目起源

**为什么要做 ccc？**

在调试 OpenClaw 的过程中，每天都要反复输入这些命令：

```bash
openclaw gateway restart
openclaw gateway status
openclaw models list
openclaw cron list
...
```

**一天几十次，烦不烦？** 😤

做了这个交互式命令行面板——**一个命令，所有功能随手可及**。

**简单、直观、高效**，小白也能轻松上手。

---

## 🎯 核心特性

| 特性 | 说明 |
|------|------|
| 🎨 **彩色菜单** | 清晰的颜色区分，一眼找到目标功能 |
| ⚡️ **一键直达** | 输入 `ccc` 即可，无需记忆复杂命令 |
| 📋 **三级导航** | 主菜单 → 子菜单 → 执行，层次清晰 |
| 🔧 **全功能覆盖** | 网关、模型、定时任务、插件、记忆管理 |
| 🌐 **网络诊断** | 一键检测 Telegram/Discord/OpenAI 连通性 |
| 💾 **执行反馈** | 命令执行后显示结果，自动返回菜单 |
| 🚀 **零学习成本** | 看到菜单就会用，无需文档 |

---

## 🚀 快速开始

### 安装（30 秒）

```bash
# 1. 克隆项目
git clone https://github.com/icoe44/openclaw-ccc.git
cd openclaw-ccc

# 2. 创建软链接（安装到系统路径）
chmod +x ccc.sh
sudo ln -sf $(pwd)/ccc.sh /usr/local/bin/ccc
```

### 使用（1 秒）

```bash
ccc
```

**就这么简单！** 接下来全是菜单导航，无需记忆任何命令。

---

## 📋 功能菜单

### 🏠 主菜单（16 个功能）

#### 服务管理
| 序号 | 功能 | 命令 |
|------|------|------|
| 1 | 启动服务 | `openclaw gateway start` |
| 2 | 停止服务 | `openclaw gateway stop` |
| 3 | 重启服务 | `openclaw gateway restart` |
| 4 | 查看状态 | `openclaw gateway status` |
| 5 | 查看日志 | `openclaw logs` |

#### 配置管理
| 序号 | 功能 | 命令 |
|------|------|------|
| 6 | 编辑主配置 | `vim openclaw.json` |
| 7 | 修改配置 | `openclaw configure` |

#### 模型管理
| 序号 | 功能 | 命令 |
|------|------|------|
| 8 | 模型列表 | `openclaw models list` |
| 9 | 模型状态 | `openclaw models status` |

#### 诊断工具
| 序号 | 功能 | 命令 |
|------|------|------|
| 10 | **网络连通性检测** | 一键检测 Google/Telegram/Discord/GitHub/OpenAI |
| 11 | **系统健康检查** | `openclaw doctor` |

#### 更多
| 序号 | 功能 | 说明 |
|------|------|------|
| 12 | 定时任务 | 进入子菜单 |
| 13 | 插件管理 | 进入子菜单 |
| 14 | 记忆管理 | 进入子菜单 |
| 15 | **打开 TUI 面板** | `openclaw dashboard` 图形界面 |
| 16 | 高级选项 | setup/onboard/run/scan 等 |

---

### 📂 子菜单

#### 定时任务管理
```
========================================
   定时任务管理
========================================

1. 列出任务                 openclaw cron list
2. 添加任务                 openclaw cron add
3. 删除任务                 openclaw cron rm <id>
4. 手动运行                 openclaw cron run <id>

0. 返回主菜单
```

#### 插件管理
```
========================================
   插件管理
========================================

1. 列出插件                 openclaw plugins list
2. 启用插件                 openclaw plugins enable <id>
3. 禁用插件                 openclaw plugins disable <id>

0. 返回主菜单
```

#### 记忆管理
```
========================================
   记忆管理
========================================

1. 查看状态                 openclaw memory status
2. 重建索引                 openclaw memory index
3. 搜索记忆                 openclaw memory search "<query>"

0. 返回主菜单
```

#### 高级选项
```
========================================
   高级选项
========================================

1. 初始化 OpenClaw          openclaw setup
2. 引导配置                 openclaw onboard
3. 前台运行（调试）         openclaw gateway run
4. 扫描模型                 openclaw models scan
5. 添加模型认证            openclaw models auth
6. 设置默认模型            openclaw models set

0. 返回主菜单
```

---

## 🌐 网络连通性检测

**选项 10** 一键检测以下服务：

| 检测项 | 说明 |
|--------|------|
| Google DNS (8.8.8.8) | 基础 DNS 连通性 |
| Cloudflare DNS (1.1.1.1) | 备用 DNS |
| Google.com (直连) | 检测是否被墙 |
| Google.com (代理) | 检测代理是否工作 |
| Telegram API | Telegram 机器人/频道 |
| Discord API | Discord 机器人 |
| GitHub API | 代码仓库/更新 |
| OpenAI API | ChatGPT/Codex |

**失败时自动显示修复建议：**
```
1. 检查 Clash 是否运行
2. 检查代理端口 (7890)
3. 切换非香港节点（OpenAI 不支持香港）
4. 运行系统健康检查（选项 11）
```

---

## 🎨 颜色说明

| 颜色 | 用途 |
|------|------|
| 🟢 绿色 | 提示语、成功信息 |
| 🔵 蓝色 | 命令展示 |
| 🟡 黄色 | 序号、重要提示 |
| 🟣 青色 | 分隔线、标题 |
| 🔴 红色 | 错误信息 |

---

## 🔧 自定义配置

### 修改颜色主题

编辑 `ccc.sh` 顶部的颜色定义：

```bash
# 可用颜色
RED='\033[0;31m'      # 红色
GREEN='\033[0;32m'    # 绿色
YELLOW='\033[1;33m'   # 黄色
BLUE='\033[0;34m'     # 蓝色
CYAN='\033[0;36m'     # 青色
NC='\033[0m'          # 重置
```

### 添加自定义命令

在 `main_loop()` 函数中添加新的 case 分支：

```bash
17) 
    echo -e "${GREEN}请输入参数：${NC}"
    read param
    run_command "openclaw your-command $param"
    ;;
```

---

## 📁 项目结构

```
openclaw-ccc/
├── ccc.sh              # 主脚本（核心文件）
├── README.md           # 项目文档（本文件）
├── LICENSE             # MIT 许可证
└── .gitignore          # Git 忽略配置
```

---

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

### 贡献流程

1. Fork 本项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

### 可以贡献什么？

- 🐛 修复 Bug
- ✨ 新增功能
- 📖 完善文档
- 🎨 优化界面
- 🌍 多语言支持

---

## ❓ 常见问题

### Q: 为什么输入 `ccc` 没反应？
A: 检查软链接是否创建成功：
```bash
ls -l /usr/local/bin/ccc
```
如果没有，重新执行安装步骤。

### Q: 网络检测全挂怎么办？
A: 
1. 检查 Clash 是否运行
2. 确认代理端口是 7890
3. 切换非香港节点（OpenAI 不支持香港）
4. 运行选项 11 系统健康检查

### Q: 支持 Windows 吗？
A: 本项目基于 Bash 脚本，Windows 需要使用 WSL 或 Git Bash。

### Q: 如何卸载？
A: 删除软链接即可：
```bash
sudo rm /usr/local/bin/ccc
```

---

## 🙏 致谢

- **[OpenClaw](https://github.com/openclaw/openclaw)** - 强大的 AI 助手框架
- **社区贡献者** - 感谢每一位贡献者

---

## 📄 许可证

本项目采用 **MIT 许可证** - 自由使用、修改、分发。

查看 [LICENSE](LICENSE) 文件了解详情。

---

## 📬 联系方式

- **项目地址**: https://github.com/icoe44/openclaw-ccc
- **问题反馈**: https://github.com/icoe44/openclaw-ccc/issues
- **OpenClaw Discord**: https://discord.com/invite/clawd

---

<div align="center">

**如果这个项目帮到了你，请给个 ⭐️ Star 支持一下！**

Made with ❤️ by G | Powered by OpenClaw

</div>
