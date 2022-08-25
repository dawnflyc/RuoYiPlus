# RuoYi-Vue-autoplus-fast

 若依自动化升级版 (已废弃)

##### 基于：

RuoYi-Vue-fast 3.8.1

RuoYi-Vue 3.8.1

##### 增强：

mybatisPlus

lombok

##### 特色功能：

1、后台管理一个表,只需要一个控制器即可

2、自动化权限，不用每个控制器方法都写@PreAuthorize

3、自动化日志，不用每个控制器都写@log，以控制器名作为模块名

##### 额外功能：

1、修改注册bean机制，使用全限定名进行注册，因此可以写同名不同包的bean

2、分割mapper，一般有3个包，admin、api、common，三个包都有mapper，这样查找mapper不会串，可以自己扩展

3、接口额外的token机制，不用自己写，需要根据自创的user调一下

4、缓存机制，可以以注解的方式自动缓存

##### 说明

分为两种模式： 1、 完全托管 2、 半自动

1、完全托管适用没有额外需求的表,仅一个控制器便可完成后台页面

2、半自动需要建立domian、mapper、service、controller，常规的结构

##### 开始

1、完全托管

    1、创建一个控制器，继承BaseDynamicController，加上 AutoAuth 、AutoLog 这两个注解

    3、实现父类的抽象方法，一个为表名（包括前缀），一个为模块名（中文）

    4、后端的代码就完成了，还需完成前端代码

2、半自动

    1、创建domian、

    2、创建mapper，系统分为三个模块 admin、common、api ，需要继承相应的mapper父类，AdminMi、ApiMi、CommonMi ，用于隔离mapper，防止匹配到其他模块

    3、创建Service，接口继承IService，实现继承ServiceImpl并实现对应接口

    4、创建Controller 继承 BaseController，加上 AutoAuth 、AutoLog 这两个注解

##### 说明:

1、接口token: 需要根据用户表调整 com.ruoyi.project.common.auth 模块，控制器方法加上注解RequireAuth即可
