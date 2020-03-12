todo list 0: 绑定自己的手机号 √
拿到国内开发者账号后，
登陆https://appleid.apple.com/
索取验证码
进入后，点击安全 -> 添加受信任的电话号码 
接着，生成App上传密码：xxx-yyy-zzz（后面使用Application Loader上传ipa包到appstore时要用到）

todo list 1: 退出旧的开发者账号  √
1.1 退出developer.apple.com上中国区的开发者账号 
    重新登陆developer.apple.com/account/ios/profile/limited/create
    会向第0步里的电话号码发送验证码

    退出itunesconnect  
    重新登陆 https://itunesconnect.apple.com/

    退出xcode上的开发者账号（xcode一直别登陆开发者账号，调试就用模拟器，打包就用描述文件 ）

1.2 开发者网站上面 创建证书  √
    1.打开Mac系统的 钥匙串访问 -> 左上角菜单：证书助理 -> 从证书颁发机构获取证书
      创建csr文件，选择存到磁盘
      常用名称：Multiple Alphabet
      邮箱写appleid的那个就行

    2.创建开发证书dev 和 生产证书dis
    3.下载证书，双击导入

// 1.3 添加真机设备？算了，直接用模拟器算了 （可以略过） 

1.4 开发者网站上，创建应用ID，即注册appid 
    net.vwhm.alphabet

// 1.5 创建描述文件？算了，直接用模拟器算了 （可以略过） 

--------------------------

todo list 7:隐私政策：privacy.html,放到 Linux服务器 √
    将本机的privacy.html scp 至 服务器
    ssh root@47.75.103.58
    password:
    cd /usr/local/nginx/html/vwhm_net_wwwroot/app/
    mkdir multiplealpha

    切回本地终端：
    cd /Users/beyond/iOS_APP/国白包1
    scp /Users/beyond/iOS_APP/国白包1/privacy.html root@47.75.103.58:/usr/local/nginx/html/vwhm_net_wwwroot/app/multiplealpha
    输入密码

    此时，再将url地址 http://vwhm.net/app/multiplealpha/privacy.html，填回itunesconnect
--------------------------
todo list 3: Logo √
    先在iconfont上找图标，https://www.iconfont.cn
    如果没有，打开PS，自己设计一个Logo
    设计appicon 1024*1024  
    然后一键生成所有图标：http://icon.wuruihong.com/
    下载并解压

todo list 4: 新建xcode工程，create a new project √
			 选择Tapped App
			 Product name:  (跟前面的appid一致)
             修改Info.plst: 多国字母
             存放到：/usr/beyond/iOS_APP/国白包1目录

             然后先关闭xcode

todo list 5: 复制podfile，√
             修改target为 alphabet
             然后执行pod install 
             打开alphabet.xcworkspace，


todo list 6: 将Assets.xcassets里原来的Appicon右键删除  √
             将前面第3步解压后的 AppIcon.appiconset 拖进来
             运行到模拟器上iPhone8   

todo list 6: 打开pod工程，开始编码和测试  √
6.1 把appicon图片拖进来，Assets.xcassets 
    设置只支持iPhone且竖屏 
6.3 打开main.storyboard，
    // 默认图标，选中图标
    // 在iconfont上找图标，下载svg，通过Sketch导出为@2x @3x图标
    // Tab图标设计规范 https://www.jianshu.com/p/0ce2d11ef195
    // 75*75 @3x
    // 50*50 @2x
6.4 打开启动界面 LaunchScreen.storyboard， 
    修改设备尺寸为： iPhone8
    加一个图标log和一个文字 
    LaunchScreen.xib加一个imageView
    90*90,距离顶边120，垂直居中
    新建一个目录：图片
    把appicon@3x.png（180*180px）拖到Resources目录里，以供imageView引用     

6.5 设置顶部的状态条Status Bar Style 为 light content 
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
} 
6.8 开始实现第1个页面中的代码 
背影图片 高斯模糊 调整配色
http://www.peise.net/tools/web/  三角形配色

6.9 需要联网
报错：NSLocalizedDescription=The resource could not be loaded because the App Transport Security policy requires the use of a secure connection.}
解决办法1： 通过python脚本把所有的音频都下载下来 ——强烈推荐
解决办法2： 更改项目的App Transport Security policy __不推荐
打开info.plist, 右键 -> open as -> source code
<key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
        <key>NSExceptionDomains</key>
        <dict>
            <key>yourdomain.com</key>
            <dict>
                <key>NSIncludesSubdomains</key>
                <true/>
                <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
                <false/>
            </dict>
       </dict>
  </dict>
--------------------------    
todo list 2: 因为开发者官网 与 itunesconnect不能实时同步， √
             所以，这次就先跳过itunesconnect那一步

todo list 2: 转到itunesconnect创建应用 
            (开发者网站上注册appid后，不一定itunesconnect会实时更新)
    转到itunesconnect,创建应用,新建app
    起名：多国字母 （可能会提示名称已被注册）
    主要语言：英文
    APP ID:net.vwhm.alphabet
    SKU: sku_multi_alphabet
    名称：多国字母
    副标题：
    类别：教育/工具
    价格：免费
    年龄分级：4+
    此时，再将隐私政策的url地址 http://vwhm.net/app/multiplealpha/privacy.html，填回itunesconnect
-------------------------- 
todo list 9: 尾声，上传项目源代码到git 
新建 .gitignore
在里面写上Pods
表示Pods目录不需要git来管理,因为它是pod install自动生成的

git init
git add --all
git commit -m 'iOS 国内区白包1 第一次提交(itunesconnect不能实时同步appid,尚未创建应用)'
git remote add origin https://github.com/ixixii/iOS_APP_GuoNei1_Alphabet.git


// 注意： 以下尚未执行。。。
git push -u origin master
git push origin master
--------------------------

todo list 7: 打包ipa，Xcode不用登陆开发者账号，使用distribution provisoning file就行

            使用Application uploder上传ipa 
            打包上传时，不用XCODE，而是推荐使用Application uploder，但是需要用app专用密码登陆才行
            url: https://appleid.apple.com/
            

            版权：

todo list 8: 8种语言本地化 后，提交苹果审核
            关键词，记得要填写

            技术支持网址：vwhm.net

            英文美国

todo list 10: 清理战场
    注销Application uploader, 
    developer.apple.com
    https://appstoreconnect.apple.com/login

    准备登陆下一个账号，写第2个国内白包         