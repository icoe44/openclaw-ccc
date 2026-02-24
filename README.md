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

受 **宝塔面板** 的启发，做了这个交互式命令行面板——**一个命令，所有功能随手可及**。

就像宝塔让服务器管理变得可视化，ccc 让 OpenClaw 管理变得**简单、直观、高效**。

---

## 🎯 核心特性

| 特性 | 说明 |
|------|------|
| 🎨 **彩色菜单** | 清晰的颜色区分，一眼找到目标功能 |
| ⚡️ **一键直达** | 输入 `ccc` 即可，无需记忆复杂命令 |
| 📋 **三级导航** | 主菜单 → 子菜单 → 执行，层次清晰 |
| 🔧 **全功能覆盖** | 网关、模型、定时任务、插件、记忆管理 |
| 💾 **执行反馈** | 命令执行后显示结果，自动返回菜单 |
| 🚀 **零学习成本** | 看到菜单就会用，无需文档 |

---

## 🚀 快速开始

### 安装（30 秒）

```bash
# 1. 克隆项目
git clone https://github.com/gtonly/openclaw-ccc.git
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

### 🏠 主菜单（23 个功能）

#### 系统初始化
| 序号 | 功能 | 命令 |
|------|------|------|
| 1 | 初始化 OpenClaw | `openclaw setup` |
| 2 | 引导配置 | `openclaw onboard` |
| 3 | 修改配置 | `openclaw configure` |

#### 服务管理
| 序号 | 功能 | 命令 |
|------|------|------|
| 4 | 启动服务 | `openclaw gateway start` |
| 5 | 停止服务 | `openclaw gateway stop` |
| 6 | 重启服务 | `openclaw gateway restart` |
| 7 | 查看服务状态 | `openclaw gateway status` |
| 8 | 查看日志 | `openclaw logs` |

#### 网关管理
| 序号 | 功能 | 命令 |
|------|------|------|
| 9 | 启动网关 | `openclaw gateway start` |
| 10 | 停止网关 | `openclaw gateway stop` |
| 11 | 重启网关 | `openclaw gateway restart` |
| 12 | 查看网关状态 | `openclaw gateway status` |
| 13 | 前台运行 | `openclaw gateway run` |

#### 状态与日志
| 序号 | 功能 | 命令 |
|------|------|------|
| 14 | 查看全局状态 | `openclaw status` |
| 15 | 查看系统日志 | `openclaw logs` |

#### 模型管理
| 序号 | 功能 | 命令 |
|------|------|------|
| 16 | 查看模型列表 | `openclaw models list` |
| 17 | 查看模型状态 | `openclaw models status` |
| 18 | 设置默认模型 | `openclaw models set <model>` |
| 19 | 扫描模型 | `openclaw models scan` |
| 20 | 添加模型认证 | `openclaw models auth add/paste-token` |

#### 高级管理（进入子菜单）
| 序号 | 功能 | 说明 |
|------|------|------|
| 21 | **定时任务管理** | 增删改查/手动运行 |
| 22 | **插件管理** | 列表/启用/禁用 |
| 23 | **记忆管理** | 状态/重建索引/语义搜索 |

---

### 📂 子菜单

#### 2.1 定时任务管理
```
========================================
   定时任务管理
========================================

1. 列出定时任务            openclaw cron list
2. 添加定时任务            openclaw cron add
3. 删除定时任务            openclaw cron rm <id>
4. 手动运行任务            openclaw cron run <id>

0. 返回主菜单
```

#### 2.2 插件管理
```
========================================
   插件管理
========================================

1. 列出插件                 openclaw plugins list
2. 启用插件                 openclaw plugins enable <id>
3. 禁用插件                 openclaw plugins disable <id>

0. 返回主菜单
```

#### 2.3 记忆管理
```
========================================
   记忆管理
========================================

1. 查看记忆状态            openclaw memory status
2. 重新建立记忆索引        openclaw memory index
3. 语义搜索记忆            openclaw memory search "<query>"

0. 返回主菜单
```

---

## 📸 界面预览

```
========================================
   欢迎使用 OpenClaw 面板
========================================

1. 初始化 OpenClaw          openclaw setup
2. 引导配置                 openclaw onboard
3. 修改配置                 openclaw configure
4. 启动服务                 openclaw gateway start
5. 停止服务                 openclaw gateway stop
6. 重启服务                 openclaw gateway restart
7. 查看服务状态             openclaw gateway status
8. 查看日志                 openclaw logs

----------------------------------------
9. 启动网关服务             openclaw gateway start
10. 停止网关服务            openclaw gateway stop
11. 重启网关服务            openclaw gateway restart
12. 查看网关状态            openclaw gateway status
13. 前台运行（不守护）      openclaw gateway run

----------------------------------------
14. 查看全局状态            openclaw status
15. 查看系统日志            openclaw logs

----------------------------------------
16. 查看模型列表            openclaw models list
17. 查看模型状态            openclaw models status
18. 设置默认模型            openclaw models set <model>
19. 扫描模型                openclaw models scan
20. 添加模型认证            openclaw models auth add/paste-token

----------------------------------------
21. 定时任务管理
22. 插件管理
23. 记忆管理

----------------------------------------
0. 退出

请输入序号选择操作：
```

---

## 🎨 颜色说明

| 颜色 | 用途 |
|------|------|
| 🟢 绿色 | 提示语、成功信息 |
| 🔵 蓝色 | 命令展示 |
| 🟡 黄色 | 序号、重要提示 |
| 🟣 紫色 | 分隔线、标题 |
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
MAGENTA='\033[0;35m'  # 紫色
WHITE='\033[1;37m'    # 白色
NC='\033[0m'          # 重置
```

### 添加自定义命令

在 `main_loop()` 函数中添加新的 case 分支：

```bash
24) 
    echo -e "${GREEN}请输入参数：${NC}"
    read param
    run_command "openclaw your-command $param"
    ;;
```

### 修改菜单文本

直接编辑对应的 `show_*_menu()` 函数，自由定制显示内容。

---

## 📁 项目结构

```
openclaw-ccc/
├── ccc.sh              # 主脚本（核心文件）
├── README.md           # 项目文档（本文件）
├── LICENSE             # MIT 许可证
├── .gitignore          # Git 忽略配置
└── PUBLISH.md          # 发布指南
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

### Q: 可以自定义菜单顺序吗？
A: 可以！直接编辑 `ccc.sh` 中的 `show_main_menu()` 函数。

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
- **[宝塔面板](https://www.bt.cn)** - 灵感来源
- **社区贡献者** - 感谢每一位贡献者

---

## 📄 许可证

本项目采用 **MIT 许可证** - 自由使用、修改、分发。

查看 [LICENSE](LICENSE) 文件了解详情。

---

## 📬 联系方式

- **项目地址**: https://github.com/gtonly/openclaw-ccc
- **问题反馈**: https://github.com/gtonly/openclaw-ccc/issues
- **OpenClaw Discord**: https://discord.com/invite/clawd

---

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=gtonly/openclaw-ccc&type=Date)](https://star-history.com/#gtonly/openclaw-ccc&Date)

---

<div align="center">

**如果这个项目帮到了你，请给个 ⭐️ Star 支持一下！**

Made with ❤️ by G | Powered by OpenClaw

</div>
