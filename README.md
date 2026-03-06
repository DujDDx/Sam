# Sam（macOS 菜单栏效率工具）

欢迎使用 Sam 👋  
此项目后期产生的所有收益将全部捐献给中国乡村发展基金会  
Sam 是一个轻量的 macOS 菜单栏应用，安装后即可直接使用，适合希望快速完成日常效率任务的用户。

项目仓库：<https://github.com/DujDDx/Sam>

## 1 分钟快速开始

### 一行命令安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/DujDDx/Sam/latest/install/install.sh | bash
```

安装完成后启动：

```bash
open "$HOME/Applications/Sam.app"
```

## 适用环境

- macOS（当前安装脚本仅支持 macOS）
- 需要系统已安装 `curl` 和 `tar`（macOS 默认自带）

## 常用安装方式

### 安装最新版本

```bash
curl -fsSL https://raw.githubusercontent.com/DujDDx/Sam/latest/install/install.sh | bash
```

### 安装指定版本（例如 `1.0`）

```bash
curl -fsSL https://raw.githubusercontent.com/DujDDx/Sam/latest/install/install.sh | VERSION="1.0" bash
```

### 安装到自定义目录

```bash
curl -fsSL https://raw.githubusercontent.com/DujDDx/Sam/latest/install/install.sh | INSTALL_DIR="$HOME/Applications" bash
```

## 升级

重新执行“一行命令安装”即可覆盖升级到最新版本。

## 卸载

```bash
rm -rf "$HOME/Applications/Sam.app"
```

## 常见问题

### 1) 提示无法打开应用

首次从网络下载的应用，macOS 可能会有安全提示。  
安装脚本已自动尝试移除隔离标记；如果仍遇到问题，可手动执行：

```bash
xattr -dr com.apple.quarantine "$HOME/Applications/Sam.app"
```

### 2) 想确认包是否完整

发布目录提供了 `SHA256SUMS` 用于校验：

`Sam_Distribute/releases/SHA256SUMS`

## 反馈与建议

欢迎在仓库提交 Issue：<https://github.com/DujDDx/Sam/issues>
