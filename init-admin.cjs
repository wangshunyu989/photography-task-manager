const { PrismaClient } = require('@prisma/client')
const bcrypt = require('bcryptjs')

const prisma = new PrismaClient()

async function initAdmin() {
  try {
    const adminEmail = 'admin@example.com'
    const adminName = '雪碧'
    const adminPassword = '123456'

    const existingAdmin = await prisma.user.findUnique({
      where: { email: adminEmail }
    })

    if (existingAdmin) {
      console.log('管理员账号已存在，跳过创建')
      await prisma.$disconnect()
      return
    }

    const hashedPassword = await bcrypt.hash(adminPassword, 10)

    await prisma.user.create({
      data: {
        name: adminName,
        email: adminEmail,
        password: hashedPassword
      }
    })

    console.log('========================================')
    console.log('✅ 管理员账号创建成功！')
    console.log('========================================')
    console.log('📧 登录邮箱：admin@example.com')
    console.log('👤 用户姓名：雪碧')
    console.log('🔑 登录密码：123456')
    console.log('========================================')
  } catch (error) {
    console.error('创建管理员账号失败：', error)
  } finally {
    await prisma.$disconnect()
  }
}

initAdmin()
