//
//  HeadView.h
//  仿QQ好友列表
//
//  Created by xhj on 15-2-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UITableViewHeaderFooterView
{
//    public BOOL isIconOpened;
}

@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel *groupName;
@property(nonatomic,assign) NSInteger section;
@property(nonatomic,assign) BOOL isIconOpened;
//定义Block，
@property(nonatomic,strong)  void (^handleBlock)(void);
@end
