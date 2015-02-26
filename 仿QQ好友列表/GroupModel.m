//
//  GroupModel.m
//  仿QQ好友列表
//
//  Created by xhj on 15-2-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "GroupModel.h"

@implementation GroupModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.groupName = [dict valueForKey:@"group"];
//        NSLog(@"%@",self.groupName);
        
        
        self.friendArray = [dict valueForKey:@"friends"];
        
        
        
    }
    
    return self;
}

@end
