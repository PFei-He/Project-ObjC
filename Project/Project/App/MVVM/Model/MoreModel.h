//
//  MoreModel.h
//  Project
//
//  Created by PFei_He on 16/5/9.
//  Copyright © 2016年 PFei_He. All rights reserved.
//

#import "BaseModel.h"

@interface MoreResults : BaseModel

@property (copy, nonatomic)     NSString        *text;
@property (copy, nonatomic)     NSString        *image;
@property (copy, nonatomic)     NSString        *sugue;

@end

@interface MoreModel : BaseModel

@property (strong, nonatomic)   NSArray         *result;

@end

@interface MoreRequest : BaseRequest

/**
 *  @brief 发送请求
 *  @note 无
 *  @param 无
 *  @return 无
 */
- (void)send;

@end
