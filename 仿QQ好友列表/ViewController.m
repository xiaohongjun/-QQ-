//
//  ViewController.m
//  仿QQ好友列表
//
//  Created by xhj on 15-2-26.
//  Copyright (c) 2015年 xhj. All rights reserved.
//

#import "ViewController.h"
#import "GroupModel.h"
#import "HeadView.h"
static const NSString *tag = @"cell";


@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *firendArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableDictionary *headDict;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.headDict = [[NSMutableDictionary alloc] init];
    [self.tableView registerClass:[HeadView class] forHeaderFooterViewReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view, typically from a nib.
}



-(NSMutableArray *)firendArray
{
    if (_firendArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray * array = [[NSArray alloc] initWithContentsOfFile:path];
        _firendArray = [[NSMutableArray alloc] initWithCapacity:array.count];
        for(NSDictionary *dict in array)
        {
            GroupModel *model = [[GroupModel alloc] initWithDict:dict];
            [_firendArray addObject:model];
        }
           }
    return _firendArray;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.firendArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        NSLog(@"初始化");
    }
    
    GroupModel *model = self.firendArray[indexPath.section];
    
    cell.textLabel.text = model.friendArray[indexPath.row];
     return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    HeadView *headView = self.headDict[@(section)];
    if(headView == nil)
    {
        headView = [[HeadView alloc] initWithReuseIdentifier:@"cell"];
        [self.headDict setValue:headView forKey:@(section)];
       
        
        GroupModel *model = self.firendArray[section];
        headView.groupName.text = model.groupName;
        headView.section = section;
         headView.isIconOpened = NO;
        __weak __typeof(headView)weakSelf = headView;
        headView.handleBlock = ^()
        {
            
            NSLog(@"%@",[NSString stringWithFormat:@"%ld",(long)section]);
            if (!weakSelf.isIconOpened) {
                weakSelf.isIconOpened = YES;
                [UIView animateWithDuration:0.5f animations:^(){
                    weakSelf.icon.transform = CGAffineTransformMakeRotation(M_PI_2);
                    NSLog(@"xuanzhaun2pi");
                }];
            }else{
                weakSelf.isIconOpened = NO;
                [UIView animateWithDuration:0.5f animations:^(){
                    weakSelf.icon.transform = CGAffineTransformMakeRotation(0);
                    NSLog(@"xuanzhaun0");
                    
                }];
            }
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:weakSelf.section] withRowAnimation:UITableViewRowAnimationFade];
            
        };
       
    }
    
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    HeadView *headView = self.headDict[@(section)];
    BOOL isOpened = headView.isIconOpened;
    if (isOpened) {
    GroupModel *model = self.firendArray[section];
    return model.friendArray.count;
    }else{
        return 0;
    }
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
