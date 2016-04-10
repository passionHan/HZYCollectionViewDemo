//
//  ViewController.m
//  HZYCollectionViewDemo
//
//  Created by passionHan on 16/4/9.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "ViewController.h"
#import "HZYCollectionReusableView.h"
#import "HZYColletionViewFlowLayout.h"
@interface ViewController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (instancetype)init{

    HZYColletionViewFlowLayout *flowLayout = [[HZYColletionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(100, 100);
    
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 5, 0);
    
    flowLayout.navHeight = 44.0;
    return [self initWithCollectionViewLayout:flowLayout];
}

static NSString *cellID = @"cellID";
static NSString *headerId = @"headerID";
- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];

    [self.collectionView registerClass:[HZYCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    
}

/**
 *  返回collectionView的组数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 20;
}

/**
 * 返回每一组的item数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section >= 0) {
        
        HZYCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        
        header.backgroundColor = [UIColor cyanColor];
        
        header.title = [NSString stringWithFormat:@"%ldsectionHeader",indexPath.section];
        
        return header;
    }
    
    return nil;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section >= 0) {
        
        return CGSizeMake(0, 44);
    }
    return CGSizeZero;
}

- (BOOL)prefersStatusBarHidden{
    
    return YES;
}

@end
