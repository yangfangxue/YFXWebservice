//
//  YY_DataCenter.m
//  Sight
//
//  Created by fangxue on 16/8/30.
//  Copyright © 2016年 fangxue. All rights reserved.
//

#import "YY_DataCenter.h"

@implementation YY_DataCenter

+ (void)loadDataCenter:(NSMutableArray *)params methodName:(NSString *)methodName result:(LoadDataCenterResult)dataResult{
    
    ServiceArgs *args = [[ServiceArgs alloc] init];
    args.methodName = methodName;//要调用的webservice方法
    args.soapParams = params;//传递方法参数
    ServiceRequestManager *manager = [ServiceRequestManager requestWithArgs:args];
    __weak ServiceRequestManager *_manager = manager;
    [manager setFinishBlock:^() {
        //请求成功
        NSDictionary *dict=[NSDictionary dictionaryWithXMLString:_manager.responseString];
        
        dataResult(dict,nil);
    }];
    [manager setFailedBlock:^() {
        //请求失败
        dataResult(nil,_manager.error.description);
    }];
    [manager startAsynchronous];
}
@end
