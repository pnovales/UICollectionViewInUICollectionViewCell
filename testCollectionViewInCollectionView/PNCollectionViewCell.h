//
//  PNCollectionViewCell.h
//  testCollectionViewInCollectionView
//
//  Created by IT on 11/29/16.
//  Copyright © 2016 usbsi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PNIndexedCollectionView : UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@interface PNCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet PNIndexedCollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *lblIndex;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
