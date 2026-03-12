# Sam

macOS 菜单栏效率工具：装好就能用，一条命令安装。

> 说明：此项目后期产生的所有收益将全部捐献给 **中国乡村发展基金会**。

- 仓库：<https://github.com/DujDDx/Sam>
- 反馈：<https://github.com/DujDDx/Sam/issues>

## 1 分钟快速开始

### 一行命令安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/DujDDx/Sam/latest/install/install.sh | bash
```

安装完成后启动：

```bash
open "$HOME/Applications/Sam.app"
```

## 系统要求

- macOS（当前安装脚本仅支持 macOS）
- 依赖：`curl`、`tar`（macOS 默认自带）

## 安装选项

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

重复执行安装命令即可覆盖升级到最新版本。

## 卸载

```bash
rm -rf "$HOME/Applications/Sam.app"
```

## 常见问题（FAQ）

### 提示“无法打开应用”/“来自身份不明的开发者”

首次从网络下载的应用，macOS 可能会有安全提示。

安装脚本已自动尝试移除隔离标记；如果仍遇到问题，可手动执行：

```bash
xattr -dr com.apple.quarantine "$HOME/Applications/Sam.app"
```

### 如何校验包完整性？

发布目录提供 `SHA256SUMS` 用于校验：

`Sam_Distribute/releases/SHA256SUMS`

---

如果你愿意补一段「Sam 具体能做什么」的功能清单（3～5 条就行），我可以把 README 再升级一版：加上功能介绍、截图占位、以及更像开源主页的结构。
