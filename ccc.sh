#!/bin/bash

# OpenClaw 快捷命令面板 - ccc
# 用法：ccc 或 bash ccc.sh

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 清屏
clear

# 显示一级菜单
show_main_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   欢迎使用 OpenClaw 面板${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} 初始化 OpenClaw          ${BLUE}openclaw setup${NC}"
    echo -e "${YELLOW}2.${NC} 引导配置                 ${BLUE}openclaw onboard${NC}"
    echo -e "${YELLOW}3.${NC} 修改配置                 ${BLUE}openclaw configure${NC}"
    echo -e "${YELLOW}4.${NC} 启动服务                 ${BLUE}openclaw gateway start${NC}"
    echo -e "${YELLOW}5.${NC} 停止服务                 ${BLUE}openclaw gateway stop${NC}"
    echo -e "${YELLOW}6.${NC} 重启服务                 ${BLUE}openclaw gateway restart${NC}"
    echo -e "${YELLOW}7.${NC} 查看服务状态             ${BLUE}openclaw gateway status${NC}"
    echo -e "${YELLOW}8.${NC} 查看日志                 ${BLUE}openclaw logs${NC}"
    echo ""
    echo -e "${CYAN}----------------------------------------${NC}"
    echo -e "${YELLOW}9.${NC} 启动网关服务             ${BLUE}openclaw gateway start${NC}"
    echo -e "${YELLOW}10.${NC} 停止网关服务            ${BLUE}openclaw gateway stop${NC}"
    echo -e "${YELLOW}11.${NC} 重启网关服务            ${BLUE}openclaw gateway restart${NC}"
    echo -e "${YELLOW}12.${NC} 查看网关状态            ${BLUE}openclaw gateway status${NC}"
    echo -e "${YELLOW}13.${NC} 前台运行（不守护）       ${BLUE}openclaw gateway run${NC}"
    echo ""
    echo -e "${CYAN}----------------------------------------${NC}"
    echo -e "${YELLOW}14.${NC} 查看全局状态            ${BLUE}openclaw status${NC}"
    echo -e "${YELLOW}15.${NC} 查看系统日志            ${BLUE}openclaw logs${NC}"
    echo ""
    echo -e "${CYAN}----------------------------------------${NC}"
    echo -e "${YELLOW}16.${NC} 查看模型列表            ${BLUE}openclaw models list${NC}"
    echo -e "${YELLOW}17.${NC} 查看模型状态            ${BLUE}openclaw models status${NC}"
    echo -e "${YELLOW}18.${NC} 设置默认模型            ${BLUE}openclaw models set <model>${NC}"
    echo -e "${YELLOW}19.${NC} 扫描模型                 ${BLUE}openclaw models scan${NC}"
    echo -e "${YELLOW}20.${NC} 添加模型认证            ${BLUE}openclaw models auth add/paste-token${NC}"
    echo ""
    echo -e "${CYAN}----------------------------------------${NC}"
    echo -e "${YELLOW}21.${NC} 定时任务管理"
    echo -e "${YELLOW}22.${NC} 插件管理"
    echo -e "${YELLOW}23.${NC} 记忆管理"
    echo ""
    echo -e "${CYAN}----------------------------------------${NC}"
    echo -e "${YELLOW}0.${NC} 退出"
    echo ""
    echo -e "${GREEN}请输入序号选择操作：${NC}"
}

# 定时任务管理菜单
show_cron_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   定时任务管理${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} 列出定时任务            ${BLUE}openclaw cron list${NC}"
    echo -e "${YELLOW}2.${NC} 添加定时任务            ${BLUE}openclaw cron add${NC}"
    echo -e "${YELLOW}3.${NC} 删除定时任务            ${BLUE}openclaw cron rm <id>${NC}"
    echo -e "${YELLOW}4.${NC} 手动运行任务            ${BLUE}openclaw cron run <id>${NC}"
    echo ""
    echo -e "${YELLOW}0.${NC} 返回主菜单"
    echo ""
    echo -e "${GREEN}请输入序号选择操作：${NC}"
}

# 插件管理菜单
show_plugins_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   插件管理${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} 列出插件                 ${BLUE}openclaw plugins list${NC}"
    echo -e "${YELLOW}2.${NC} 启用插件                 ${BLUE}openclaw plugins enable <id>${NC}"
    echo -e "${YELLOW}3.${NC} 禁用插件                 ${BLUE}openclaw plugins disable <id>${NC}"
    echo ""
    echo -e "${YELLOW}0.${NC} 返回主菜单"
    echo ""
    echo -e "${GREEN}请输入序号选择操作：${NC}"
}

# 记忆管理菜单
show_memory_menu() {
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${GREEN}   记忆管理${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} 查看记忆状态            ${BLUE}openclaw memory status${NC}"
    echo -e "${YELLOW}2.${NC} 重新建立记忆索引        ${BLUE}openclaw memory index${NC}"
    echo -e "${YELLOW}3.${NC} 语义搜索记忆            ${BLUE}openclaw memory search "<query>"${NC}"
    echo ""
    echo -e "${YELLOW}0.${NC} 返回主菜单"
    echo ""
    echo -e "${GREEN}请输入序号选择操作：${NC}"
}

# 执行命令
run_command() {
    echo ""
    echo -e "${CYAN}执行命令：${NC} $1"
    echo -e "${CYAN}----------------------------------------${NC}"
    eval "$1"
    echo ""
    echo -e "${YELLOW}按回车键返回菜单...${NC}"
    read
}

# 主循环
main_loop() {
    while true; do
        show_main_menu
        read -r choice
        
        case $choice in
            1) run_command "openclaw setup" ;;
            2) run_command "openclaw onboard" ;;
            3) run_command "openclaw configure" ;;
            4) run_command "openclaw gateway start" ;;
            5) run_command "openclaw gateway stop" ;;
            6) run_command "openclaw gateway restart" ;;
            7) run_command "openclaw gateway status" ;;
            8) run_command "openclaw logs" ;;
            9) run_command "openclaw gateway start" ;;
            10) run_command "openclaw gateway stop" ;;
            11) run_command "openclaw gateway restart" ;;
            12) run_command "openclaw gateway status" ;;
            13) run_command "openclaw gateway run" ;;
            14) run_command "openclaw status" ;;
            15) run_command "openclaw logs" ;;
            16) run_command "openclaw models list" ;;
            17) run_command "openclaw models status" ;;
            18) 
                echo -e "${GREEN}请输入模型名称：${NC}"
                read model
                run_command "openclaw models set $model"
                ;;
            19) run_command "openclaw models scan" ;;
            20)
                echo -e "${GREEN}输入 add 或 paste-token：${NC}"
                read subcmd
                run_command "openclaw models auth $subcmd"
                ;;
            21) cron_menu_loop ;;
            22) plugins_menu_loop ;;
            23) memory_menu_loop ;;
            0) 
                echo -e "${GREEN}再见！${NC}"
                exit 0
                ;;
            *) 
                echo -e "${RED}无效输入，请重试${NC}"
                sleep 1
                ;;
        esac
    done
}

# 定时任务子菜单
cron_menu_loop() {
    while true; do
        show_cron_menu
        read -r choice
        
        case $choice in
            1) run_command "openclaw cron list" ;;
            2) run_command "openclaw cron add" ;;
            3) 
                echo -e "${GREEN}请输入任务 ID：${NC}"
                read id
                run_command "openclaw cron rm $id"
                ;;
            4) 
                echo -e "${GREEN}请输入任务 ID：${NC}"
                read id
                run_command "openclaw cron run $id"
                ;;
            0) return ;;
            *) 
                echo -e "${RED}无效输入，请重试${NC}"
                sleep 1
                ;;
        esac
    done
}

# 插件管理子菜单
plugins_menu_loop() {
    while true; do
        show_plugins_menu
        read -r choice
        
        case $choice in
            1) run_command "openclaw plugins list" ;;
            2) 
                echo -e "${GREEN}请输入插件 ID：${NC}"
                read id
                run_command "openclaw plugins enable $id"
                ;;
            3) 
                echo -e "${GREEN}请输入插件 ID：${NC}"
                read id
                run_command "openclaw plugins disable $id"
                ;;
            0) return ;;
            *) 
                echo -e "${RED}无效输入，请重试${NC}"
                sleep 1
                ;;
        esac
    done
}

# 记忆管理子菜单
memory_menu_loop() {
    while true; do
        show_memory_menu
        read -r choice
        
        case $choice in
            1) run_command "openclaw memory status" ;;
            2) run_command "openclaw memory index" ;;
            3) 
                echo -e "${GREEN}请输入搜索关键词：${NC}"
                read query
                run_command "openclaw memory search \"$query\""
                ;;
            0) return ;;
            *) 
                echo -e "${RED}无效输入，请重试${NC}"
                sleep 1
                ;;
        esac
    done
}

# 启动
main_loop
