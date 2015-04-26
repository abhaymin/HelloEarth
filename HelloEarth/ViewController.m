//
//  ViewController.m
//  HelloEarth
//
//  Created by Abhay Menon on 26/04/15.
//  Copyright (c) 2015 Abhay Menon. All rights reserved.
//

#import "ViewController.h"
#import "MaplyComponent.h"

@interface ViewController ()


@end

@implementation ViewController
{
    MaplyViewController *theViewC;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Create an empty globe and add it to the view
    
    theViewC = [[MaplyViewController alloc] init];
    [self.view addSubview:theViewC.view];
    
    theViewC.view.frame = self.view.bounds;
    [self addChildViewController:theViewC];
    
    MaplyViewController *mapViewC = nil;
    
    mapViewC = (MaplyViewController *)theViewC;
    
    // and thirty fps if we can get it ­ change this to 3 if you find your app is struggling
    theViewC.frameInterval = 2;
    
    // set up the data source
    MaplyMBTileSource *tileSource =
    [[MaplyMBTileSource alloc] initWithMBTiles:@"geography-class_medres"];

    // set up the layer
    MaplyQuadImageTilesLayer *layer =
    [[MaplyQuadImageTilesLayer alloc] initWithCoordSystem:tileSource.coordSys
                                               tileSource:tileSource];
    layer.handleEdges = false;
    layer.coverPoles = false;
    layer.requireElev = false;
    layer.waitLoad = false;
    layer.drawPriority = 0;
    layer.singleLevelLoading = false;
    [theViewC addLayer:layer];
    
    mapViewC.height = 1.0;
    
    [mapViewC animateToPosition:MaplyCoordinateMakeWithDegrees(-122.4192,37.7793)
                           time:1.0];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
