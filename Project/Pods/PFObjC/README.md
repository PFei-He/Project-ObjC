![logo](https://github.com/PFei-He/PFObjC/blob/master/PFObjC.png)
[PFObjC](https://github.com/PFei-He/PFObjC)
===

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://raw.githubusercontent.com/PFei-He/PFObjC/master/LICENSE)
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/PFObjC.svg)](https://img.shields.io/cocoapods/v/PFObjC.svg)

对系统API进行简单封装，实现常用功能

版本
---
0.2.3

说明
---
#### Catagory
* `NSDate+PFObjC`       - NSDate类目
* `NSString+PFObjC`     - NSString类目
* `NSTimer+PFObjC`      - NSTimer类目
* `UIAlertView+PFObjC`  - UIAlertView类目
* `UIView+PFObjC`       - UIView类目

#### Framework
* `PFConfigure`         - 本类库常用宏
* `PFFile`              - 实现文件生成和读写功能
* `PFModel`             - 数据模型基类
* `PFQRCode`            - 利用AVFoundation框架生成二维码
* `PFScanner`           - 扫描器
* `PFTime`              - 实现时间获取和转换功能
 
#### Other
* `PFObjC.h` - 类库接口

安装
--- 
#### 手动安装
```
将`PFObjC`文件夹拖入到工程目录中，导入文件`PFObjC.h`
```

#### CocoaPods
```
platform:ios, '7.0'
pod 'PFObjC', '~> 0.2'
```

使用
---
#### CocoaPods
```
#import <PFObjC/PFObjC.h>
```
 
许可证
---
`PFObjC`使用 MIT 许可证，详情见 [LICENSE](https://raw.githubusercontent.com/PFei-He/PFObjC/master/LICENSE) 文件。
