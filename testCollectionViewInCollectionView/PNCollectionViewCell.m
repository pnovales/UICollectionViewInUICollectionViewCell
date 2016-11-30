//
//  PNCollectionViewCell.m
//  testCollectionViewInCollectionView
//
//  Created by IT on 11/29/16.
//  Copyright © 2016 usbsi. All rights reserved.
//

#import "PNCollectionViewCell.h"

@implementation PNIndexedCollectionView

@end


@implementation PNCollectionViewCell

-(void)awakeFromNib{
    [super awakeFromNib];
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.sectionInset = UIEdgeInsetsMake(10, 10, 9, 10);
//    layout.itemSize = CGSizeMake(44, 44);
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    self.collectionView = [[PNIndexedCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
//    self.collectionView.backgroundColor = [UIColor whiteColor];
//    self.collectionView.showsHorizontalScrollIndicator = NO;
//    [self.contentView addSubview:self.collectionView];
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    //self.collectionView.frame = self.contentView.bounds;
    
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.indexPath = indexPath;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    
    [self.collectionView reloadData];
}

@end
