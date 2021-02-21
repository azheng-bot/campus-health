# *Campus-health*
校园卫生分派可视化系统

### 接口文档地址
https://web.postman.co/workspace/62e48599-9fd0-4b17-8da1-3771eeedbb00/documentation/9105156-5d2982c7-c28e-434c-8021-3714014cd758

(谷歌浏览器打不开就用IE浏览器)



### 数据库设置
+ username:root


+ password:root



### UI设计参考网页

1. http://www.plus1-tech.com/article.php?id=65
2. https://www.zcool.com.cn/work/ZMTkzODYzNzI=.html?switchPage=on



---





## 登录

#### 登录说明

登录的用户把token返回给后台后会被分为管理员和超级管理员。

管理员就是负责管卫生，负责分派卫生和检查卫生后提交卫生情况；
超级管理员就是拥有普通管理员的权限，同时可以拥有管理普通管理员、管理班级等的权限。

不同权限后台返回的数据是不同的，显示的页面也是不同的。

#### 示例账号

+ 管理员：

  username：李闯闯
  password：123456

+ 超级管理员：

  username：admin
  password：123456

  ​

#### token说明

要给headers的Authorization添加token值，后台才能接收到token



### 项目草图

统计页1：https://ae01.alicdn.com/kf/Ubb17c2083e5d4d4db264e99ce76695af9.jpg

统计页2：https://ae01.alicdn.com/kf/Uc2f9a7688e7e4964a51c742317327679S.jpg



