# flutter_windows

一个跨平台的flutter开发模板，使用流行的get来管理路由，使用getx来管理数据状态，并且配置了国际化支持。使用dio来管理网络请求，
使用shared_preferences实现本地临时数据存储，并且实现了全局loading效果，可以支持快速开发使用。
github仓库地址：https://github.com/Sjj1024/flutter_windows

# 分支介绍

main分支：最简单的最通用的模板，集成了get路由管理和getx数据状态管理，还有全局loading效果，还有shared_preferences临时数据存储，
仿照前端开发localstoreage来存储数据，项目结构也是仿照前端开发结构，让前端开发人员以熟悉的方式开发flutter软件，并且以最简单最快速的方式
来开发项目。

update: 添加自动更新支持

# 目录结构

apis: api管理，  
components：组件管理，  
i18n：国家化语言配置，支持传参这种
pages: 页面管理，  
router：路由管理，  
stores：状态管理，  
utils：工具类，包含请求类，本地数据临时存储类

# 使用的依赖

get: ^4.6.6  
dio: ^5.4.0  
shared_preferences: ^2.2.2

# 使用方法

1.克隆到本地：

```agsl
git clone  https://github.com/Sjj1024/flutter_windows
```
 
2.安装依赖：

```agsl
flutter pub get
```
   
3.运行项目：

```agsl
flutter run
```
  
4.修改项目名称
想要快速修改项目名称和id，可以看这篇文章，使用rename非常快速方便的修改：https://xiaoshen.blog.csdn.net/article/details/135602066  
  
5.修改平台图标
快速修改全平台图标的方式：https://xiaoshen.blog.csdn.net/article/details/135730737   
或者修改assets中的图标，然后运行：
```
flutter pub run flutter_launcher_icons
```
  
# 项目截图

![](https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/flutter/1705289866045image.png)
![](https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/flutter/1705289874889image.png)
![](https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/flutter/1705289906511image.png)
![](https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/flutter/1705289916595image.png)
![](https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/flutter/1705289924713image.png)
![](https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/flutter/1705289936286image.png)
国际化配置：
![](https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/flutter/1705299265544image.png)
手机端展示：   
![](https://jsd.cdn.zzko.cn/gh/1024huijia/FileHub@main/root/flutter/all.png)