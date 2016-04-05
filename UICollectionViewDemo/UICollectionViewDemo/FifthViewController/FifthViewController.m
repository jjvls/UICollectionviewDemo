//
//  FifthViewController.m
//  UICollectionViewDemo
//
//  Created by jiejin on 16/4/2.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "FifthViewController.h"
#import "RFLayout.h"
#import "FifthCollectionViewCell.h"

static NSString * const CellReuseIdentify = @"CellReuseIdentify";

@interface FifthViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCollectionview;

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myCollectionview = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[RFLayout alloc] init]];
    
    self.myCollectionview.backgroundColor = [UIColor whiteColor];
    self.myCollectionview.delegate = self;
    self.myCollectionview.dataSource = self;
    
    [self.myCollectionview registerClass:[FifthCollectionViewCell class] forCellWithReuseIdentifier:CellReuseIdentify];
    
    [self.view addSubview:self.myCollectionview];
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
