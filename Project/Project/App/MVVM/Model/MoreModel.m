//
//  MoreModel.m
//  Project
//
//  Created by PFei_He on 16/5/9.
//  Copyright © 2016年 PFei_He. All rights reserved.
//

#import "MoreModel.h"

@implementation MoreResults

@end

@implementation MoreModel

@end

@implementation MoreRequest

//发送请求
- (void)send
{
    MoreModel *model = [MoreModel modelWithJSON:[self params]];
    [self requestSuccessWithObject:model];
}

///参数
- (NSDictionary *)params
{
    return @{@"result": @[@{@"text": @"设置"},
                          @{@"text": @"关于"},
                          @{@"text": @"退出登录"}]};
}

@end
