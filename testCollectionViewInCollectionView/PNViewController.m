//
//  ViewController.m
//  testCollectionViewInCollectionView
//
//  Created by IT on 11/29/16.
//  Copyright © 2016 usbsi. All rights reserved.
//

#import "PNViewController.h"
#import "PNCollectionViewCell.h"
#import "PNChildCollectionViewCell.h"

@interface PNViewController ()

@property (nonatomic, strong) NSArray *colorArray;
@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;

@end

@implementation PNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    const NSInteger numberOfTableViewRows = 20;
    const NSInteger numberOfCollectionViewCells = 15;
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:numberOfTableViewRows];
    
    for (NSInteger tableViewRow = 0; tableViewRow < numberOfTableViewRows; tableViewRow++)
    {
        NSMutableArray *colorArray = [NSMutableArray arrayWithCapacity:numberOfCollectionViewCells];
        
        for (NSInteger collectionViewItem = 0; collectionViewItem < numberOfCollectionViewCells; collectionViewItem++)
        {
            
            CGFloat red = arc4random() % 255;
            CGFloat green = arc4random() % 255;
            CGFloat blue = arc4random() % 255;
            UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0f];
            
            [colorArray addObject:color];
        }
        
        [mutableArray addObject:colorArray];
    }
    
    self.colorArray = [NSArray arrayWithArray:mutableArray];
    
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    if (collectionView == _cvOne) {
        return self.colorArray.count;
    }else{
        
        NSArray *collectionViewArray = self.colorArray[[(PNIndexedCollectionView *)collectionView indexPath].row];
        return collectionViewArray.count;
    
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == _cvOne) {
        static NSString *CellIdentifier = @"Cell";
        
        PNCollectionViewCell *cell = (PNCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        
        cell.lblIndex.text = [NSString stringWithFormat:@"%ld", (long)[indexPath row]];
        
        return cell;
    }else{
        
        static NSString *CellIdentifier = @"CellInner";
        
        PNChildCollectionViewCell *cell = (PNChildCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        
        NSArray *collectionViewArray = self.colorArray[[(PNIndexedCollectionView *)collectionView indexPath].row];
        cell.backgroundColor = collectionViewArray[indexPath.item];
        
        cell.lblIndex.text = [NSString stringWithFormat:@"%ld", (long)[indexPath row]];
        
        
        
        return cell;
    
    }
    
    
    
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(PNCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell isKindOfClass:[PNCollectionViewCell class]]) {
        
        [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
        NSInteger index = cell.collectionView.indexPath.row;
        
        CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
        [cell.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
    }
    

}











@end
