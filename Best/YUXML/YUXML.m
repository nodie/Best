//
//  YUXML.m
//  Best
//
//  Created by 於 琦峰 on 12-09-24.
//  Copyright (c) 2012年 於 琦峰. All rights reserved.
//

#import "YUXML.h"
#import "GDataXMLNode.h"

@implementation YUXML

@synthesize nodie;

- (void) Analyze {
    
    NSString *url = [@"http://118.26.200.36/nodie/BJBJ.xml" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *xml = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error:nil];
    
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithXMLString:xml options:0 error:nil] autorelease];
    
    NSArray *nodes = [doc.rootElement children];
    
    NSString *childxml;
    for (GDataXMLNode *node in nodes) {
        if ([[node name] isEqualToString:@"Cities"]) {
            //NSLog(@"node=%@", node.XMLString);
            childxml = node.XMLString;
            break;
        }
    }
    
    doc = [[[GDataXMLDocument alloc] initWithXMLString:childxml options:0 error:nil] autorelease];
    nodes = [doc.rootElement children];
    
    
    NSMutableArray *location = [[[NSMutableArray alloc] initWithCapacity:10] autorelease];
    
    for (GDataXMLNode *node in nodes) {
        //NSLog(@"node=%@ %@", node.name, node.XMLString);

        GDataXMLDocument *doc2 = [[[GDataXMLDocument alloc] initWithXMLString:node.XMLString options:0 error:nil] autorelease];
        NSArray *nodes2 = [doc2.rootElement children];
        //NSLog(@"node2=%@ %@", nodes2.objectEnumerator, node.stringValue);
        
        
        //NSLog(@"node=%@ %@", [[nodes2 objectAtIndex:0] stringValue], [[nodes2 objectAtIndex:1] stringValue]);
        
        NSMutableDictionary *dir=[[NSMutableDictionary alloc] initWithCapacity:1];
        [dir setObject:[[[nodes2 objectAtIndex:0] stringValue] substringToIndex:2] forKey:@"ci"];
        [dir setObject:[[[nodes2 objectAtIndex:0] stringValue] substringFromIndex:2] forKey:@"en"];
        [dir setObject:[[nodes2 objectAtIndex:1] stringValue] forKey:@"cn"];
        [location addObject:dir];
        [dir release];
    }
    
    NSSortDescriptor *_sorter  = [[NSSortDescriptor alloc] initWithKey:@"en" ascending:YES];
    //NSLog(@"根据name排序:\n%@",[location sortedArrayUsingDescriptors:[NSArray arrayWithObjects:_sorter, nil]]);
    NSArray *sortLocation = [location sortedArrayUsingDescriptors:[NSArray arrayWithObjects:_sorter, nil]];
    
    //[location sortedArrayUsingSelector:@selector(localizedCompare:)];
    for (int i=0; i<[sortLocation count]; i++) {
        NSLog(@"%@%@ %@", [[sortLocation objectAtIndex:i] objectForKey:@"ci"]
              , [[sortLocation objectAtIndex:i] objectForKey:@"en"]
              , [[sortLocation objectAtIndex:i] objectForKey:@"cn"]);
    }
    [_sorter release];
}

@end
