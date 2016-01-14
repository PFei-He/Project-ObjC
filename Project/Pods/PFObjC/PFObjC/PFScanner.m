//
//  PFScanner.m
//  PFObjC
//
//  Created by PFei_He on 15/11/17.
//  Copyright © 2015年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/PFObjC
//
//  vesion: 0.2.3
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  ***** 扫描器 *****
//

#import "PFScanner.h"
#import <AVFoundation/AVFoundation.h>

@interface PFScanner () <AVCaptureMetadataOutputObjectsDelegate>

///输出
@property (strong, nonatomic) AVCaptureMetadataOutput       *output;
///拍摄会话
@property (strong, nonatomic) AVCaptureSession              *session;
///预览
@property (strong, nonatomic) AVCaptureVideoPreviewLayer    *previewLayer;

@end

@implementation PFScanner

#pragma mark - Life Cycle

//初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //设置输出（Metadata元数据）
        self.output = [[AVCaptureMetadataOutput alloc] init];
    }
    return self;
}

#pragma mark - Property Methods

//扫描器的工作区域
- (void)setRectOfInterest:(CGRect)rectOfInterest
{
    _rectOfInterest = rectOfInterest;
    self.output.rectOfInterest = rectOfInterest;
}

#pragma mark - Public Methods

///创建扫描器
- (void)createInView:(UIView *)view
{
    //实例化摄像头设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //设置输入，把摄像头作为输入设备
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    //设置输出的代理
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //拍摄会话
    self.session = [[AVCaptureSession alloc] init];
    
    //设置拍摄质量
    self.session.sessionPreset = AVCaptureSessionPresetHigh;
    
    //添加输入
    if ([self.session canAddInput:input]) {
        [self.session addInput:input];
    }
    
    //添加输出
    if ([self.session canAddOutput:self.output]) {
        [self.session addOutput:self.output];
    }
    
    /**
     * p.s. 由于苹果的API设置问题，必须先将输出（AVCaptureMetadataOutput）添加到会话（AVCaptureSession），再对输出的元数组对象类型（metadataObjectTypes）进行设置
     */
    //设置输出的格式
    self.output.metadataObjectTypes = @[AVMetadataObjectTypeCode128Code,
                                        AVMetadataObjectTypeCode39Code,
                                        AVMetadataObjectTypeCode39Mod43Code,
                                        AVMetadataObjectTypeCode93Code,
                                        AVMetadataObjectTypeEAN13Code,
                                        AVMetadataObjectTypeEAN8Code,
                                        AVMetadataObjectTypeQRCode];
    
    //设置预览
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.previewLayer.frame = view.bounds;
    
    //将预览添加到当前视图
    [view.layer addSublayer:self.previewLayer];
    
    //开始会话
    [self.session startRunning];
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate Methods

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    //扫描完成，停止会话
    [self.session stopRunning];
    
    //删除预览
    [self.previewLayer removeFromSuperlayer];
    
    //获取扫描结果
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *object = metadataObjects[0];
        if (self.delegate) {
            [self.delegate scanner:self captureCompletedWithString:object.stringValue];
        }
    }
}

@end
