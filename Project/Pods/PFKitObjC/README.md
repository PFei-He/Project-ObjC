[PFKit](https://github.com/PFei-He/PFKitObjC)
===

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://raw.githubusercontent.com/PFei-He/PFKitObjC/master/LICENSE)
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/PFKitObjC.svg)](https://img.shields.io/cocoapods/v/PFKitObjC.svg)

简易的iOS组件包。A simple iOS components.

版本 Version
---
0.0.7

说明 Detail
---
#### Catagory
* `NSString+PFKit`      - NSString类目
* `UIView+PFKit`        - UIView类目

#### Debug
* `PFDebug`             - 调试

#### Framework
* `PFFile`              - 实现文件生成和读写功能
* `PFModel`             - 数据模型基类
* `PFQRCode`            - 利用AVFoundation框架生成二维码
* `PFScanner`           - 扫描器
 
#### Other
* `PFKit`               - 类库接口

安装 Install
--- 
#### 手动安装 Manually
```
将`PFKit`文件夹拖入到工程目录中，导入文件`PFKit.h`
```

#### CocoaPods
```
target 'YourTarget' do
    platform:ios, '7.0'
    pod 'PFKitObjC', '~> 0.0.7'
end
```

使用 Use
---
#### CocoaPods
```
#import <PFKitObjC/PFKit.h>
```

Swift
---
`PFKit`提供了`Swift`的版本以便使用。[PFKitSwift](https://github.com/PFei-He/PFKitSwift) <br>
`PFKit`also provides`Swift`version. [PFKitSwift](https://github.com/PFei-He/PFKitSwift)
 
许可证 LICENSE
---
`PFKit`使用 MIT 许可证，详情见 [LICENSE](https://raw.githubusercontent.com/PFei-He/PFKitObjC/master/LICENSE) 文件。
`PFKit` is released under the MIT license, see [LICENSE](https://raw.githubusercontent.com/PFei-He/PFKitObjC/master/LICENSE) for details.
