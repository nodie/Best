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
    
    
    for (GDataXMLNode *node in nodes) {
        //NSLog(@"node=%@ %@", node.name, node.XMLString);

        GDataXMLDocument *doc2 = [[[GDataXMLDocument alloc] initWithXMLString:node.XMLString options:0 error:nil] autorelease];
        NSArray *nodes2 = [doc2.rootElement children];
        //NSLog(@"node2=%@ %@", nodes2.objectEnumerator, node.stringValue);
        
        
        NSLog(@"node=%@ %@", [[nodes2 objectAtIndex:0] stringValue], [[nodes2 objectAtIndex:1] stringValue]);
    }
}

@end
