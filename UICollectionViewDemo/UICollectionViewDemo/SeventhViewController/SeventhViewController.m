//
//  SeventhViewController.m
//  UICollectionViewDemo
//
//  Created by jiejin on 16/4/3.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "SeventhViewController.h"
#import "FifthCollectionViewCell.h"
#import "ObliqueOneByOneLayout.h"

static NSString * const CellReuseIdentify = @"CellReuseIdentify";

@interface SeventhViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)UICollectionView *myCollectionView;

@end

@implementation SeventhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[ObliqueOneByOneLayout alloc] init]];
    
    self.myCollectionView.backgroundColor = [UIColor whiteColor];
    self.myCollectionView.dataSource = self;
    [self.myCollectionView registerClass:[FifthCollectionViewCell class] forCellWithReuseIdentifier:CellReuseIdentify];
    
    [self.view addSubview:self.myCollectionView];
    
    self.myCollectionView.pagingEnabled = YES;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   
    return  20;
    
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
