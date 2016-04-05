//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by jiejin on 16/3/30.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titlesArray;

@end

static NSString * const CellIdentify = @"myCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"UICollectionViewDemo";
    
    self.titlesArray = @[@"规则网状列表",@"不规则列表",@"自定义瀑布流",@"第三方瀑布流",@"一次多个的横向滑动",@"一次一个的横向滑动",@"一次一个的（横向＋旋转）滑动"];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 44;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentify];

    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDelegate&UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
    
        FirstViewController *targetVC = [[FirstViewController alloc] init];
        
        [self.navigationController pushViewController:targetVC animated:YES];
    }else if(indexPath.row == 1){
    
        SecondViewController *targetVC = [[SecondViewController alloc] init];
        
        [self.navigationController pushViewController:targetVC animated:YES];
    }else if(indexPath.row == 2){
        
        ThirdViewController *targetVC = [[ThirdViewController alloc] init];
        
        [self.navigationController pushViewController:targetVC animated:YES];
    }else if(indexPath.row == 3){
        
        ForthViewController *targetVC = [[ForthViewController alloc] init];
        
        [self.navigationController pushViewController:targetVC animated:YES];
    }else if(indexPath.row == 4){
        
        FifthViewController *targetVC = [[FifthViewController alloc] init];
        
        [self.navigationController pushViewController:targetVC animated:YES];
    }else if(indexPath.row == 5){
        
        SixthViewController *targetVC = [[SixthViewController alloc] init];
        
        [self.navigationController pushViewController:targetVC animated:YES];
    }else if(indexPath.row == 6){
        
        SeventhViewController *targetVC = [[SeventhViewController alloc] init];
        
        [self.navigationController pushViewController:targetVC animated:YES];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentify];
    
    if(cell == nil){
    
        cell = [[UITableViewCell alloc] init];
    }
    
    cell.textLabel.text = self.titlesArray[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
