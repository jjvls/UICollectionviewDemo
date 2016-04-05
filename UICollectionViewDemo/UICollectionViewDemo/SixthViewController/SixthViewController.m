//
//  SixthViewController.m
//  UICollectionViewDemo
//
//  Created by jiejin on 16/4/2.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "SixthViewController.h"
#import "OnebyOneLayout.h"
#import "FifthCollectionViewCell.h"

static NSString * const CellReuseIdentify = @"CellReuseIdentify";

@interface SixthViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)UICollectionView *myCollectionView;

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[OnebyOneLayout alloc] init]];
    
    self.myCollectionView.backgroundColor = [UIColor whiteColor];
    self.myCollectionView.dataSource = self;
    self.myCollectionView.delegate = self;
    
    [self.myCollectionView registerClass:[FifthCollectionViewCell class] forCellWithReuseIdentifier:CellReuseIdentify];
    
    [self.view addSubview:self.myCollectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FifthCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentify forIndexPath:indexPath];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
