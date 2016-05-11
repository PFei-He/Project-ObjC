![logo](https://github.com/PFei-He/Project-ObjC/blob/master/Project.png)
[Project](https://github.com/PFei-He/Project-ObjC)
===
 
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://raw.githubusercontent.com/PFei-He/Project-ObjC/master/LICENSE)
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)

快速开发集成框架

版本
---
0.0.4

说明
---
#### 关于项目
本项目既是一个iOS开发的示例工程，也是一个可用于快速开发的集成框架，为iOS初学者、工程管理能力较弱以及需要进行快速工程搭建的开发者提供一个基础的框架。
本项目已嵌入了以下能力：

* CocoaPods
* 网络请求
* KVC解析JSON

#### 目录解释
`Project`使用`MVVM`架构搭建，共分为3个部分。

* Pods - CocoaPods目录，集合了工程使用的所有第三方类库，用于作为工程底层的支持。
* Builds - 基础框架目录，提供工程使用的基础父类，提供快速开发的基本能力
* Project - 工程目录，项目开发的目录。开发者在本层进行开发工作。

#### 关于CocoaPods
本项目不接入CocoaPods。

#### 关于Swift
为方便开发者使用，本框架另提供了Swift版本。[点我跳转](https://github.com/PFei-He/Project-Swift)至`Project-Swift`

示例代码
---
声明：示例使用的是`中国天气网`提供的开放接口，如有侵权，请告知！

#### API
```objective-c
{
    "api":["101010100.html", //北京天气接口
           "101020100.html", //上海天气接口
           "101280101.html"] //广州天气接口
}
```

#### Model
```objective-c
//发送请求
- (void)send
{
    [self requestWillStart];
    @weakify_self
    [self send:^(id JSON) {
        @strongify_self
        if (JSON) {
            WeatherModel *model = [WeatherModel modelWithJSON:JSON];
            WeatherResult *result = [WeatherResult modelWithJSON:model.weatherinfo];
            [self requestSuccessWithObject:result];
            [self requestWasEnded];
        } else {
            [self requestFailedWithObject:@"请求失败"];
            [self requestWasEnded];
        }
    }];
}
```

#### ViewModel
```objective-c
//添加网络请求
[self initRequests:@[self.req?self.req:(self.req=[WeatherRequest new])]];
```

```objective-c
//请求成功
- (void)requestSuccessNotification:(NSNotification *)notification
{
    [super requestSuccessNotification:notification];
    WeatherResult *result = (WeatherResult *)self.successObject;
    self.cityLabel.text = result.city;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@%@", result.temp, @"℃"];
}
```

#### 更多
更多功能请[下载](https://github.com/PFei-He/Project-ObjC/archive/master.zip)查看DEMO

文件模板使用（Xcode 7+）
---
请将下载到的`Project Class.xctemplate`放置于`~/Library/Developer/Xcode/Templates/File Templates/Source/`文件夹下，如过程中没有此些文件夹，请自行创建。

![Screenshot](https://github.com/PFei-He/Project-ObjC/blob/master/Supports/Screenshot.png)

模板中带有以下的类，请开发者自行选择继承
* BasisModel - 数据模型和请求接口
* BasisCollectionViewController - 图表视图控制器
* BasisTableViewController - 列表视图控制器
* BasisViewController - 视图控制器

许可证
---
`Project`使用 MIT 许可证，详情见 [LICENSE](https://raw.githubusercontent.com/PFei-He/Project-ObjC/master/LICENSE) 文件。
