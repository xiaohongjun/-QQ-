//
//  HeadView.m
//  仿QQ好友列表
//
//  Created by xhj on 15-2-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
//        isOpened = NO;
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 30, 30)];
        self.icon.contentMode = UIViewContentModeScaleToFill;
        self.icon.image = [UIImage imageNamed:@"disclosure"];
        [self.contentView addSubview:self.icon];
        self.groupName = [[UILabel  alloc]initWithFrame:CGRectMake(50, 0, 200, 30)];
        [self.contentView addSubview:self.groupName];
//       self.contentView
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)tapHandler
{
       
        self.handleBlock();

}



@end
