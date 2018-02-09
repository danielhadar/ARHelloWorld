//
//  ViewController.m
//  ARHelloWorld
//
//  Created by Daniel Hadar on 09/02/2018.
//  Copyright © 2018 Daniel Hadar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) ARSCNView *sceneView;

@end

@implementation ViewController

- (instancetype)init {
  if (self = [super init]) {
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Add AR Scene view
  [self setupSceneView];
  
  // Set the view's delegate
  self.sceneView.delegate = self;
  
  // Show statistics such as fps and timing information
  self.sceneView.showsStatistics = YES;
  
  // Create a new scene
  SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
  
  // Set the scene to the view
  self.sceneView.scene = scene;
}

- (void)setupSceneView {
  self.sceneView = [[ARSCNView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:self.sceneView];
  
//  self.sceneView.translatesAutoresizingMaskIntoConstraints = false;
//  self.sceneView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true;
//  self.sceneView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true;
//  self.sceneView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
//  self.sceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  // Create a session configuration
  ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
  
  // Run the view's session
  [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  
  // Pause the view's session
  [self.sceneView.session pause];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - ARSCNViewDelegate

/*
 // Override to create and configure nodes for anchors added to the view's session.
 - (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
 SCNNode *node = [SCNNode new];
 
 // Add geometry to the node...
 
 return node;
 }
 */

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
  // Present an error message to the user
  
}

- (void)sessionWasInterrupted:(ARSession *)session {
  // Inform the user that the session has been interrupted, for example, by presenting an overlay
  
}

- (void)sessionInterruptionEnded:(ARSession *)session {
  // Reset tracking and/or remove existing anchors if consistent tracking is required
  
}

@end
