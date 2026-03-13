# 摄影师数据管理系统

一个专门为摄影师设计的拍摄数据和提成计算管理系统。

## 功能特性

- 用户注册和登录
- 拍摄任务管理（添加、编辑、删除）
- 自定义拍摄类型、数量、金额
- 记录拍摄日期和完成日期
- 数据统计展示（总金额、总数量、完成率）
- 响应式设计，支持移动端

## 技术栈

- **前端框架**: Next.js 14 + TypeScript
- **UI样式**: Tailwind CSS
- **身份验证**: NextAuth.js
- **数据库**: SQLite (开发) / PostgreSQL (生产)
- **ORM**: Prisma
- **部署平台**: Zeabur

## 本地开发

### 前置要求

- Node.js 18+ 
- npm

### 安装步骤

1. 克隆仓库
```bash
git clone <your-repo-url>
cd photo-task-manager
```

2. 安装依赖
```bash
npm install
```

3. 设置环境变量
```bash
cp .env.example .env
```

编辑 `.env` 文件，设置以下变量：
```
DATABASE_URL="file:./dev.db"
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-secret-key-here"
```

可以使用以下命令生成安全的密钥：
```bash
openssl rand -base64 32
```

4. 初始化数据库
```bash
npx prisma generate
npx prisma db push
```

5. 启动开发服务器
```bash
npm run dev
```

访问 [http://localhost:3000](http://localhost:3000)

## 部署到 Zeabur

### 1. 准备 GitHub 仓库

确保你的代码已经推送到 GitHub 仓库。

### 2. 在 Zeabur 上创建项目

1. 访问 [Zeabur](https://zeabur.com) 并登录
2. 点击 "New Project" 创建新项目
3. 选择 "Deploy from GitHub"
4. 授权 Zeabur 访问你的 GitHub 仓库
5. 选择这个项目仓库

### 3. 配置环境变量

在 Zeabur 项目设置中添加以下环境变量：

```
DATABASE_URL="postgresql://..."  # Zeabur 提供的 PostgreSQL 连接地址
NEXTAUTH_URL="https://your-domain.zeabur.app"
NEXTAUTH_SECRET="your-production-secret-key"
```

### 4. 配置数据库

Zeabur 提供免费的 PostgreSQL 数据库：
1. 在 Zeabur 项目中点击 "Add Service"
2. 选择 "PostgreSQL"
3. 创建后会自动生成 `DATABASE_URL`

### 5. 部署

Zeabur 会自动检测到你的项目并开始部署。

## 项目结构

```
photo-task-manager/
├── app/
│   ├── api/
│   │   ├── auth/[...nextauth]/    # NextAuth 配置
│   │   ├── register/               # 注册 API
│   │   └── tasks/                  # 任务 CRUD API
│   ├── dashboard/                  # 仪表盘页面
│   ├── login/                      # 登录页面
│   ├── register/                   # 注册页面
│   ├── globals.css                 # 全局样式
│   ├── layout.tsx                  # 根布局
│   └── page.tsx                    # 首页
├── components/
│   └── SessionProvider.tsx         # Session 提供者
├── lib/
│   └── prisma.ts                   # Prisma 客户端
├── prisma/
│   └── schema.prisma               # 数据库模型
├── types/
│   └── next-auth.d.ts              # NextAuth 类型定义
├── Dockerfile                      # Docker 配置
├── zeabur.toml                     # Zeabur 配置
└── package.json
```

## 数据库模型

### User (用户)
- id: 唯一标识符
- name: 用户姓名
- email: 用户邮箱（唯一）
- password: 加密密码
- tasks: 关联的拍摄任务

### Task (拍摄任务)
- id: 唯一标识符
- userId: 所属用户ID
- type: 拍摄类型
- quantity: 拍摄数量
- amount: 金额
- shootDate: 拍摄日期
- finishDate: 完成日期（可选）
- isCompleted: 是否完成

## 许可证

MIT
