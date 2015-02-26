//
//  GroupModel.h
//  仿QQ好友列表
//
//  Created by xhj on 15-2-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject

@property(nonatomic,copy) NSString *groupName;

@property(nonatomic,strong) NSArray *friendArray;


-(instancetype)initWithDict:(NSDictionary *)dict;

@end
