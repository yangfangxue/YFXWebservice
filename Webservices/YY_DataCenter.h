//
//  YY_DataCenter.h
//  Sight
//
//  Created by fangxue on 16/8/30.
//  Copyright © 2016年 fangxue. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LoadDataCenterResult)(NSDictionary *resultDic,NSString *error);

@interface YY_DataCenter : NSObject

+ (void)loadDataCenter:(NSMutableArray *)params methodName:(NSString *)methodName result:(LoadDataCenterResult)dataResult;

@end
