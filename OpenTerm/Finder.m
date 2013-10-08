/*
 * Finder.m
 */

#include "Finder.h"




/*
 * Finder Basics
 */

@implementation FinderApplication

typedef struct { __unsafe_unretained NSString *name; FourCharCode code; } classForCode_t;
static const classForCode_t classForCodeData__[] = {
	{ @"FinderApplication", 'capp' },
	{ @"FinderItem", 'cobj' },
	{ @"FinderContainer", 'ctnr' },
	{ @"FinderComputerObject", 'ccmp' },
	{ @"FinderDisk", 'cdis' },
	{ @"FinderFolder", 'cfol' },
	{ @"FinderDesktopObject", 'cdsk' },
	{ @"FinderTrashObject", 'ctrs' },
	{ @"FinderFile", 'file' },
	{ @"FinderAliasFile", 'alia' },
	{ @"FinderApplicationFile", 'appf' },
	{ @"FinderDocumentFile", 'docf' },
	{ @"FinderInternetLocationFile", 'inlf' },
	{ @"FinderClipping", 'clpf' },
	{ @"FinderPackage", 'pack' },
	{ @"FinderWindow", 'cwin' },
	{ @"FinderFinderWindow", 'brow' },
	{ @"FinderDesktopWindow", 'dktw' },
	{ nil, 0 }
};

- (NSDictionary *) classNamesForCodes
{
	static NSMutableDictionary *dict__;

	if (!dict__) @synchronized([self class]) {
	if (!dict__) {
		dict__ = [[NSMutableDictionary alloc] init];
		const classForCode_t *p;
		for (p = classForCodeData__; p->name != nil; ++p)
			[dict__ setObject:p->name forKey:[NSNumber numberWithInt:p->code]];
	} }
	return dict__;
}

typedef struct { FourCharCode code; __unsafe_unretained NSString *name; } codeForPropertyName_t;
static const codeForPropertyName_t codeForPropertyNameData__[] = {
	{ 'pcli', @"clipboard" },
	{ 'pnam', @"name" },
	{ 'pvis', @"visible" },
	{ 'pisf', @"frontmost" },
	{ 'sele', @"selection" },
	{ 'pins', @"insertionLocation" },
	{ 'ver2', @"productVersion" },
	{ 'vers', @"version" },
	{ 'sdsk', @"startupDisk" },
	{ 'desk', @"desktop" },
	{ 'trsh', @"trash" },
	{ 'home', @"home" },
	{ 'pcmp', @"computerContainer" },
	{ 'pfrp', @"FinderPreferences" },
	{ 'pnam', @"name" },
	{ 'dnam', @"displayedName" },
	{ 'nmxt', @"nameExtension" },
	{ 'hidx', @"extensionHidden" },
	{ 'pidx', @"index" },
	{ 'ctnr', @"container" },
	{ 'cdis', @"disk" },
	{ 'posn', @"position" },
	{ 'dpos', @"desktopPosition" },
	{ 'pbnd', @"bounds" },
	{ 'labi', @"labelIndex" },
	{ 'aslk', @"locked" },
	{ 'kind', @"kind" },
	{ 'dscr', @"objectDescription" },
	{ 'comt', @"comment" },
	{ 'ptsz', @"size" },
	{ 'phys', @"physicalSize" },
	{ 'ascd', @"creationDate" },
	{ 'asmo', @"modificationDate" },
	{ 'iimg', @"icon" },
	{ 'pURL', @"URL" },
	{ 'sown', @"owner" },
	{ 'sgrp', @"group" },
	{ 'ownr', @"ownerPrivileges" },
	{ 'gppr', @"groupPrivileges" },
	{ 'gstp', @"everyonesPrivileges" },
	{ 'iwnd', @"informationWindow" },
	{ 'pALL', @"properties" },
	{ 'pcls', @"objectClass" },
	{ 'ects', @"entireContents" },
	{ 'pexa', @"expandable" },
	{ 'pexp', @"expanded" },
	{ 'pexc', @"completelyExpanded" },
	{ 'cwnd', @"containerWindow" },
	{ 'ID  ', @"id" },
	{ 'capa', @"capacity" },
	{ 'frsp', @"freeSpace" },
	{ 'isej', @"ejectable" },
	{ 'isrv', @"localVolume" },
	{ 'istd', @"startup" },
	{ 'dfmt', @"format" },
	{ 'Jrnl', @"journalingEnabled" },
	{ 'igpr', @"ignorePrivileges" },
	{ 'warn', @"warnsBeforeEmptying" },
	{ 'asty', @"fileType" },
	{ 'fcrt', @"creatorType" },
	{ 'pspd', @"stationery" },
	{ 'ver2', @"productVersion" },
	{ 'vers', @"version" },
	{ 'orig', @"originalItem" },
	{ 'ID  ', @"id" },
	{ 'sprt', @"suggestedSize" },
	{ 'mprt', @"minimumSize" },
	{ 'appt', @"preferredSize" },
	{ 'isab', @"acceptsHighLevelEvents" },
	{ 'hscr', @"hasScriptingTerminology" },
	{ 'Clsc', @"opensInClassic" },
	{ 'iloc', @"location" },
	{ 'lwnd', @"clippingWindow" },
	{ 'ID  ', @"id" },
	{ 'posn', @"position" },
	{ 'pbnd', @"bounds" },
	{ 'ptit', @"titled" },
	{ 'pnam', @"name" },
	{ 'pidx', @"index" },
	{ 'hclb', @"closeable" },
	{ 'isfl', @"floating" },
	{ 'pmod', @"modal" },
	{ 'prsz', @"resizable" },
	{ 'iszm', @"zoomable" },
	{ 'pzum', @"zoomed" },
	{ 'pvis', @"visible" },
	{ 'wshd', @"collapsed" },
	{ 'pALL', @"properties" },
	{ 'fvtg', @"target" },
	{ 'pvew', @"currentView" },
	{ 'icop', @"iconViewOptions" },
	{ 'lvop', @"listViewOptions" },
	{ 'cvop', @"columnViewOptions" },
	{ 'tbvi', @"toolbarVisible" },
	{ 'stvi', @"statusbarVisible" },
	{ 'sbwi', @"sidebarWidth" },
	{ 'cobj', @"item" },
	{ 'panl', @"currentPanel" },
	{ 'panl', @"currentPanel" },
	{ 'dpic', @"desktopPicture" },
	{ 'pnam', @"name" },
	{ 'pvis', @"visible" },
	{ 'pisf', @"frontmost" },
	{ 'file', @"file" },
	{ 'asty', @"fileType" },
	{ 'fcrt', @"creatorType" },
	{ 'isab', @"acceptsHighLevelEvents" },
	{ 'revt', @"acceptsRemoteEvents" },
	{ 'hscr', @"hasScriptingTerminology" },
	{ 'appt', @"totalPartitionSize" },
	{ 'pusd', @"partitionSpaceUsed" },
	{ 'appf', @"applicationFile" },
	{ 'dafi', @"deskAccessoryFile" },
	{ 'cwin', @"window" },
	{ 'icop', @"iconViewOptions" },
	{ 'lvop', @"listViewOptions" },
	{ 'cvop', @"columnViewOptions" },
	{ 'sprg', @"foldersSpringOpen" },
	{ 'dela', @"delayBeforeSpringing" },
	{ 'pdhd', @"desktopShowsHardDisks" },
	{ 'pehd', @"desktopShowsExternalHardDisks" },
	{ 'pdrm', @"desktopShowsRemovableMedia" },
	{ 'pdsv', @"desktopShowsConnectedServers" },
	{ 'pnwt', @"newWindowTarget" },
	{ 'ponw', @"foldersOpenInNewWindows" },
	{ 'pocv', @"newWindowsOpenInColumnView" },
	{ 'psnx', @"allNameExtensionsShowing" },
	{ 'pnam', @"name" },
	{ 'pidx', @"index" },
	{ 'colr', @"color" },
	{ 'ICN#', @"largeMonochromeIconAndMask" },
	{ 'l8mk', @"large8BitMask" },
	{ 'il32', @"large32BitIcon" },
	{ 'icl8', @"large8BitIcon" },
	{ 'icl4', @"large4BitIcon" },
	{ 'ics#', @"smallMonochromeIconAndMask" },
	{ 'ics8', @"small8BitMask" },
	{ 'is32', @"small32BitIcon" },
	{ 'ics8', @"small8BitIcon" },
	{ 'ics4', @"small4BitIcon" },
	{ 'iarr', @"arrangement" },
	{ 'lvis', @"iconSize" },
	{ 'mnfo', @"showsItemInfo" },
	{ 'prvw', @"showsIconPreview" },
	{ 'fsiz', @"textSize" },
	{ 'lpos', @"labelPosition" },
	{ 'ibkg', @"backgroundPicture" },
	{ 'colr', @"backgroundColor" },
	{ 'fsiz', @"textSize" },
	{ 'shic', @"showsIcon" },
	{ 'prvw', @"showsIconPreview" },
	{ 'shpr', @"showsPreviewColumn" },
	{ 'dspr', @"disclosesPreviewPane" },
	{ 'sfsz', @"calculatesFolderSizes" },
	{ 'prvw', @"showsIconPreview" },
	{ 'lvis', @"iconSize" },
	{ 'fsiz', @"textSize" },
	{ 'srtc', @"sortColumn" },
	{ 'urdt', @"usesRelativeDates" },
	{ 'pidx', @"index" },
	{ 'pnam', @"name" },
	{ 'sord', @"sortDirection" },
	{ 'clwd', @"width" },
	{ 'clwn', @"minimumWidth" },
	{ 'clwm', @"maximumWidth" },
	{ 'pvis', @"visible" },
	{ 0, nil } 
};

- (NSDictionary *) codesForPropertyNames
{
	static NSMutableDictionary *dict__;

	if (!dict__) @synchronized([self class]) {
	if (!dict__) {
		dict__ = [[NSMutableDictionary alloc] init];
		const codeForPropertyName_t *p;
		for (p = codeForPropertyNameData__; p->name != nil; ++p)
			[dict__ setObject:[NSNumber numberWithInt:p->code] forKey:p->name];
	} }
	return dict__;
}


- (SBElementArray *) items
{
	return [self elementArrayWithCode:'cobj'];
}


- (SBElementArray *) containers
{
	return [self elementArrayWithCode:'ctnr'];
}


- (SBElementArray *) disks
{
	return [self elementArrayWithCode:'cdis'];
}


- (SBElementArray *) folders
{
	return [self elementArrayWithCode:'cfol'];
}


- (SBElementArray *) files
{
	return [self elementArrayWithCode:'file'];
}


- (SBElementArray *) aliasFiles
{
	return [self elementArrayWithCode:'alia'];
}


- (SBElementArray *) applicationFiles
{
	return [self elementArrayWithCode:'appf'];
}


- (SBElementArray *) documentFiles
{
	return [self elementArrayWithCode:'docf'];
}


- (SBElementArray *) internetLocationFiles
{
	return [self elementArrayWithCode:'inlf'];
}


- (SBElementArray *) clippings
{
	return [self elementArrayWithCode:'clpf'];
}


- (SBElementArray *) packages
{
	return [self elementArrayWithCode:'pack'];
}


- (SBElementArray *) windows
{
	return [self elementArrayWithCode:'cwin'];
}


- (SBElementArray *) FinderWindows
{
	return [self elementArrayWithCode:'brow'];
}


- (SBElementArray *) clippingWindows
{
	return [self elementArrayWithCode:'lwnd'];
}



- (SBObject *) clipboard
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'pcli'];
}

- (NSString *) name
{
	return [[self propertyWithCode:'pnam'] get];
}

- (BOOL) visible
{
	id v = [[self propertyWithCode:'pvis'] get];
	return [v boolValue];
}

- (void) setVisible: (BOOL) visible
{
	id v = [NSNumber numberWithBool:visible];
	[[self propertyWithCode:'pvis'] setTo:v];
}

- (BOOL) frontmost
{
	id v = [[self propertyWithCode:'pisf'] get];
	return [v boolValue];
}

- (void) setFrontmost: (BOOL) frontmost
{
	id v = [NSNumber numberWithBool:frontmost];
	[[self propertyWithCode:'pisf'] setTo:v];
}

- (SBObject *) selection
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'sele'];
}

- (void) setSelection: (SBObject *) selection
{
	[[self propertyWithClass:[SBObject class] code:'sele'] setTo:selection];
}

- (SBObject *) insertionLocation
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'pins'];
}

- (NSString *) productVersion
{
	return [[self propertyWithCode:'ver2'] get];
}

- (NSString *) version
{
	return [[self propertyWithCode:'vers'] get];
}

- (FinderDisk *) startupDisk
{
	return (FinderDisk *) [self propertyWithClass:[FinderDisk class] code:'sdsk'];
}

- (FinderDesktopObject *) desktop
{
	return (FinderDesktopObject *) [self propertyWithClass:[FinderDesktopObject class] code:'desk'];
}

- (FinderTrashObject *) trash
{
	return (FinderTrashObject *) [self propertyWithClass:[FinderTrashObject class] code:'trsh'];
}

- (FinderFolder *) home
{
	return (FinderFolder *) [self propertyWithClass:[FinderFolder class] code:'home'];
}

- (FinderComputerObject *) computerContainer
{
	return (FinderComputerObject *) [self propertyWithClass:[FinderComputerObject class] code:'pcmp'];
}

- (void) quit
{
	[self sendEvent:'aevt' id:'quit' parameters:0];
}

- (void) activate
{
	[self sendEvent:'misc' id:'actv' parameters:0];
}

- (void) copy
{
	[self sendEvent:'misc' id:'copy' parameters:0];
}

- (void) eject
{
	[self sendEvent:'fndr' id:'ejct' parameters:0];
}

- (void) emptySecurity:(BOOL)security
{
	[self sendEvent:'fndr' id:'empt' parameters:'sec\?', [NSNumber numberWithBool:security], 0];
}

- (void) restart
{
	[self sendEvent:'fndr' id:'rest' parameters:0];
}

- (void) shutDown
{
	[self sendEvent:'fndr' id:'shut' parameters:0];
}

- (void) sleep
{
	[self sendEvent:'fndr' id:'slep' parameters:0];
}


@end




/*
 * Finder items
 */

@implementation FinderItem


- (NSString *) name
{
	return [[self propertyWithCode:'pnam'] get];
}

- (void) setName: (NSString *) name
{
	[[self propertyWithCode:'pnam'] setTo:name];
}

- (NSString *) displayedName
{
	return [[self propertyWithCode:'dnam'] get];
}

- (NSString *) nameExtension
{
	return [[self propertyWithCode:'nmxt'] get];
}

- (void) setNameExtension: (NSString *) nameExtension
{
	[[self propertyWithCode:'nmxt'] setTo:nameExtension];
}

- (BOOL) extensionHidden
{
	id v = [[self propertyWithCode:'hidx'] get];
	return [v boolValue];
}

- (void) setExtensionHidden: (BOOL) extensionHidden
{
	id v = [NSNumber numberWithBool:extensionHidden];
	[[self propertyWithCode:'hidx'] setTo:v];
}

- (NSInteger) index
{
	id v = [[self propertyWithCode:'pidx'] get];
	return [v integerValue];
}

- (SBObject *) container
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'ctnr'];
}

- (SBObject *) disk
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'cdis'];
}

- (NSPoint) position
{
	id v = [[self propertyWithCode:'posn'] get];
	return [v pointValue];
}

- (void) setPosition: (NSPoint) position
{
	id v = [NSValue valueWithPoint:position];
	[[self propertyWithCode:'posn'] setTo:v];
}

- (NSPoint) desktopPosition
{
	id v = [[self propertyWithCode:'dpos'] get];
	return [v pointValue];
}

- (void) setDesktopPosition: (NSPoint) desktopPosition
{
	id v = [NSValue valueWithPoint:desktopPosition];
	[[self propertyWithCode:'dpos'] setTo:v];
}

- (NSRect) bounds
{
	id v = [[self propertyWithCode:'pbnd'] get];
	return [v rectValue];
}

- (void) setBounds: (NSRect) bounds
{
	id v = [NSValue valueWithRect:bounds];
	[[self propertyWithCode:'pbnd'] setTo:v];
}

- (NSInteger) labelIndex
{
	id v = [[self propertyWithCode:'labi'] get];
	return [v integerValue];
}

- (void) setLabelIndex: (NSInteger) labelIndex
{
	id v = [NSNumber numberWithInteger:labelIndex];
	[[self propertyWithCode:'labi'] setTo:v];
}

- (BOOL) locked
{
	id v = [[self propertyWithCode:'aslk'] get];
	return [v boolValue];
}

- (void) setLocked: (BOOL) locked
{
	id v = [NSNumber numberWithBool:locked];
	[[self propertyWithCode:'aslk'] setTo:v];
}

- (NSString *) kind
{
	return [[self propertyWithCode:'kind'] get];
}

- (NSString *) objectDescription
{
	return [[self propertyWithCode:'dscr'] get];
}

- (NSString *) comment
{
	return [[self propertyWithCode:'comt'] get];
}

- (void) setComment: (NSString *) comment
{
	[[self propertyWithCode:'comt'] setTo:comment];
}

- (long long) size
{
	id v = [[self propertyWithCode:'ptsz'] get];
	return [v longLongValue];
}

- (long long) physicalSize
{
	id v = [[self propertyWithCode:'phys'] get];
	return [v longLongValue];
}

- (NSDate *) creationDate
{
	return [[self propertyWithCode:'ascd'] get];
}

- (NSDate *) modificationDate
{
	return [[self propertyWithCode:'asmo'] get];
}

- (void) setModificationDate: (NSDate *) modificationDate
{
	[[self propertyWithCode:'asmo'] setTo:modificationDate];
}

- (NSString *) URL
{
	return [[self propertyWithCode:'pURL'] get];
}

- (NSString *) owner
{
	return [[self propertyWithCode:'sown'] get];
}

- (void) setOwner: (NSString *) owner
{
	[[self propertyWithCode:'sown'] setTo:owner];
}

- (NSString *) group
{
	return [[self propertyWithCode:'sgrp'] get];
}

- (void) setGroup: (NSString *) group
{
	[[self propertyWithCode:'sgrp'] setTo:group];
}

- (FinderPriv) ownerPrivileges
{
	id v = [[self propertyWithCode:'ownr'] get];
	return [v enumCodeValue];
}

- (void) setOwnerPrivileges: (FinderPriv) ownerPrivileges
{
	id v = [NSAppleEventDescriptor descriptorWithEnumCode:ownerPrivileges];
	[[self propertyWithCode:'ownr'] setTo:v];
}

- (FinderPriv) groupPrivileges
{
	id v = [[self propertyWithCode:'gppr'] get];
	return [v enumCodeValue];
}

- (void) setGroupPrivileges: (FinderPriv) groupPrivileges
{
	id v = [NSAppleEventDescriptor descriptorWithEnumCode:groupPrivileges];
	[[self propertyWithCode:'gppr'] setTo:v];
}

- (FinderPriv) everyonesPrivileges
{
	id v = [[self propertyWithCode:'gstp'] get];
	return [v enumCodeValue];
}

- (void) setEveryonesPrivileges: (FinderPriv) everyonesPrivileges
{
	id v = [NSAppleEventDescriptor descriptorWithEnumCode:everyonesPrivileges];
	[[self propertyWithCode:'gstp'] setTo:v];
}

- (SBObject *) informationWindow
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'iwnd'];
}

- (NSDictionary *) properties
{
	return [[self propertyWithCode:'pALL'] get];
}

- (void) setProperties: (NSDictionary *) properties
{
	[[self propertyWithCode:'pALL'] setTo:properties];
}


- (void) openUsing:(SBObject *)using_ withProperties:(NSDictionary *)withProperties
{
	[self sendEvent:'aevt' id:'odoc' parameters:'usin', using_, 'prdt', withProperties, 0];
}

- (void) printWithProperties:(NSDictionary *)withProperties
{
	[self sendEvent:'aevt' id:'pdoc' parameters:'prdt', withProperties, 0];
}

- (void) activate
{
	[self sendEvent:'misc' id:'actv' parameters:0];
}

- (void) close
{
	[self sendEvent:'core' id:'clos' parameters:0];
}

- (NSInteger) dataSizeAs:(NSNumber *)as
{
	id result__ = [self sendEvent:'core' id:'dsiz' parameters:'rtyp', as, 0];
	return [result__ integerValue];
}

- (SBObject *) delete
{
	id result__ = [self sendEvent:'core' id:'delo' parameters:0];
	return result__;
}

- (SBObject *) duplicateTo:(SBObject *)to replacing:(BOOL)replacing routingSuppressed:(BOOL)routingSuppressed exactCopy:(BOOL)exactCopy
{
	id result__ = [self sendEvent:'core' id:'clon' parameters:'insh', to, 'alrp', [NSNumber numberWithBool:replacing], 'rout', [NSNumber numberWithBool:routingSuppressed], 'exct', [NSNumber numberWithBool:exactCopy], 0];
	return result__;
}

- (BOOL) exists
{
	id result__ = [self sendEvent:'core' id:'doex' parameters:0];
	return [result__ boolValue];
}

- (SBObject *) moveTo:(SBObject *)to replacing:(BOOL)replacing positionedAt:(NSArray *)positionedAt routingSuppressed:(BOOL)routingSuppressed
{
	id result__ = [self sendEvent:'core' id:'move' parameters:'insh', to, 'alrp', [NSNumber numberWithBool:replacing], 'mvpl', positionedAt, 'rout', [NSNumber numberWithBool:routingSuppressed], 0];
	return result__;
}

- (void) select
{
	[self sendEvent:'misc' id:'slct' parameters:0];
}

- (void) eject
{
	[self sendEvent:'fndr' id:'ejct' parameters:0];
}

- (void) emptySecurity:(BOOL)security
{
	[self sendEvent:'fndr' id:'empt' parameters:'sec\?', [NSNumber numberWithBool:security], 0];
}

- (void) erase
{
	[self sendEvent:'fndr' id:'fera' parameters:0];
}

- (void) reveal
{
	[self sendEvent:'misc' id:'mvis' parameters:0];
}

- (void) updateNecessity:(BOOL)necessity registeringApplications:(BOOL)registeringApplications
{
	[self sendEvent:'fndr' id:'fupd' parameters:'nec\?', [NSNumber numberWithBool:necessity], 'reg\?', [NSNumber numberWithBool:registeringApplications], 0];
}


@end




/*
 * Containers and folders
 */

@implementation FinderContainer


- (SBElementArray *) items
{
	return [self elementArrayWithCode:'cobj'];
}


- (SBElementArray *) containers
{
	return [self elementArrayWithCode:'ctnr'];
}


- (SBElementArray *) folders
{
	return [self elementArrayWithCode:'cfol'];
}


- (SBElementArray *) files
{
	return [self elementArrayWithCode:'file'];
}


- (SBElementArray *) aliasFiles
{
	return [self elementArrayWithCode:'alia'];
}


- (SBElementArray *) applicationFiles
{
	return [self elementArrayWithCode:'appf'];
}


- (SBElementArray *) documentFiles
{
	return [self elementArrayWithCode:'docf'];
}


- (SBElementArray *) internetLocationFiles
{
	return [self elementArrayWithCode:'inlf'];
}


- (SBElementArray *) clippings
{
	return [self elementArrayWithCode:'clpf'];
}


- (SBElementArray *) packages
{
	return [self elementArrayWithCode:'pack'];
}



- (SBObject *) entireContents
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'ects'];
}

- (BOOL) expandable
{
	id v = [[self propertyWithCode:'pexa'] get];
	return [v boolValue];
}

- (BOOL) expanded
{
	id v = [[self propertyWithCode:'pexp'] get];
	return [v boolValue];
}

- (void) setExpanded: (BOOL) expanded
{
	id v = [NSNumber numberWithBool:expanded];
	[[self propertyWithCode:'pexp'] setTo:v];
}

- (BOOL) completelyExpanded
{
	id v = [[self propertyWithCode:'pexc'] get];
	return [v boolValue];
}

- (void) setCompletelyExpanded: (BOOL) completelyExpanded
{
	id v = [NSNumber numberWithBool:completelyExpanded];
	[[self propertyWithCode:'pexc'] setTo:v];
}

- (SBObject *) containerWindow
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'cwnd'];
}



@end


@implementation FinderComputerObject



@end


@implementation FinderDisk


- (SBElementArray *) items
{
	return [self elementArrayWithCode:'cobj'];
}


- (SBElementArray *) containers
{
	return [self elementArrayWithCode:'ctnr'];
}


- (SBElementArray *) folders
{
	return [self elementArrayWithCode:'cfol'];
}


- (SBElementArray *) files
{
	return [self elementArrayWithCode:'file'];
}


- (SBElementArray *) aliasFiles
{
	return [self elementArrayWithCode:'alia'];
}


- (SBElementArray *) applicationFiles
{
	return [self elementArrayWithCode:'appf'];
}


- (SBElementArray *) documentFiles
{
	return [self elementArrayWithCode:'docf'];
}


- (SBElementArray *) internetLocationFiles
{
	return [self elementArrayWithCode:'inlf'];
}


- (SBElementArray *) clippings
{
	return [self elementArrayWithCode:'clpf'];
}


- (SBElementArray *) packages
{
	return [self elementArrayWithCode:'pack'];
}



- (NSInteger) id
{
	id v = [[self propertyWithCode:'ID  '] get];
	return [v integerValue];
}

- (long long) capacity
{
	id v = [[self propertyWithCode:'capa'] get];
	return [v longLongValue];
}

- (long long) freeSpace
{
	id v = [[self propertyWithCode:'frsp'] get];
	return [v longLongValue];
}

- (BOOL) ejectable
{
	id v = [[self propertyWithCode:'isej'] get];
	return [v boolValue];
}

- (BOOL) localVolume
{
	id v = [[self propertyWithCode:'isrv'] get];
	return [v boolValue];
}

- (BOOL) startup
{
	id v = [[self propertyWithCode:'istd'] get];
	return [v boolValue];
}

- (FinderEdfm) format
{
	id v = [[self propertyWithCode:'dfmt'] get];
	return [v enumCodeValue];
}

- (BOOL) journalingEnabled
{
	id v = [[self propertyWithCode:'Jrnl'] get];
	return [v boolValue];
}

- (BOOL) ignorePrivileges
{
	id v = [[self propertyWithCode:'igpr'] get];
	return [v boolValue];
}

- (void) setIgnorePrivileges: (BOOL) ignorePrivileges
{
	id v = [NSNumber numberWithBool:ignorePrivileges];
	[[self propertyWithCode:'igpr'] setTo:v];
}



@end


@implementation FinderFolder


- (SBElementArray *) items
{
	return [self elementArrayWithCode:'cobj'];
}


- (SBElementArray *) containers
{
	return [self elementArrayWithCode:'ctnr'];
}


- (SBElementArray *) folders
{
	return [self elementArrayWithCode:'cfol'];
}


- (SBElementArray *) files
{
	return [self elementArrayWithCode:'file'];
}


- (SBElementArray *) aliasFiles
{
	return [self elementArrayWithCode:'alia'];
}


- (SBElementArray *) applicationFiles
{
	return [self elementArrayWithCode:'appf'];
}


- (SBElementArray *) documentFiles
{
	return [self elementArrayWithCode:'docf'];
}


- (SBElementArray *) internetLocationFiles
{
	return [self elementArrayWithCode:'inlf'];
}


- (SBElementArray *) clippings
{
	return [self elementArrayWithCode:'clpf'];
}


- (SBElementArray *) packages
{
	return [self elementArrayWithCode:'pack'];
}




@end


@implementation FinderDesktopObject


- (SBElementArray *) items
{
	return [self elementArrayWithCode:'cobj'];
}


- (SBElementArray *) containers
{
	return [self elementArrayWithCode:'ctnr'];
}


- (SBElementArray *) disks
{
	return [self elementArrayWithCode:'cdis'];
}


- (SBElementArray *) folders
{
	return [self elementArrayWithCode:'cfol'];
}


- (SBElementArray *) files
{
	return [self elementArrayWithCode:'file'];
}


- (SBElementArray *) aliasFiles
{
	return [self elementArrayWithCode:'alia'];
}


- (SBElementArray *) applicationFiles
{
	return [self elementArrayWithCode:'appf'];
}


- (SBElementArray *) documentFiles
{
	return [self elementArrayWithCode:'docf'];
}


- (SBElementArray *) internetLocationFiles
{
	return [self elementArrayWithCode:'inlf'];
}


- (SBElementArray *) clippings
{
	return [self elementArrayWithCode:'clpf'];
}


- (SBElementArray *) packages
{
	return [self elementArrayWithCode:'pack'];
}




@end


@implementation FinderTrashObject


- (SBElementArray *) items
{
	return [self elementArrayWithCode:'cobj'];
}


- (SBElementArray *) containers
{
	return [self elementArrayWithCode:'ctnr'];
}


- (SBElementArray *) folders
{
	return [self elementArrayWithCode:'cfol'];
}


- (SBElementArray *) files
{
	return [self elementArrayWithCode:'file'];
}


- (SBElementArray *) aliasFiles
{
	return [self elementArrayWithCode:'alia'];
}


- (SBElementArray *) applicationFiles
{
	return [self elementArrayWithCode:'appf'];
}


- (SBElementArray *) documentFiles
{
	return [self elementArrayWithCode:'docf'];
}


- (SBElementArray *) internetLocationFiles
{
	return [self elementArrayWithCode:'inlf'];
}


- (SBElementArray *) clippings
{
	return [self elementArrayWithCode:'clpf'];
}


- (SBElementArray *) packages
{
	return [self elementArrayWithCode:'pack'];
}



- (BOOL) warnsBeforeEmptying
{
	id v = [[self propertyWithCode:'warn'] get];
	return [v boolValue];
}

- (void) setWarnsBeforeEmptying: (BOOL) warnsBeforeEmptying
{
	id v = [NSNumber numberWithBool:warnsBeforeEmptying];
	[[self propertyWithCode:'warn'] setTo:v];
}



@end




/*
 * Files
 */

@implementation FinderFile


- (NSNumber *) fileType
{
	return [[self propertyWithCode:'asty'] get];
}

- (void) setFileType: (NSNumber *) fileType
{
	[[self propertyWithCode:'asty'] setTo:fileType];
}

- (NSNumber *) creatorType
{
	return [[self propertyWithCode:'fcrt'] get];
}

- (void) setCreatorType: (NSNumber *) creatorType
{
	[[self propertyWithCode:'fcrt'] setTo:creatorType];
}

- (BOOL) stationery
{
	id v = [[self propertyWithCode:'pspd'] get];
	return [v boolValue];
}

- (void) setStationery: (BOOL) stationery
{
	id v = [NSNumber numberWithBool:stationery];
	[[self propertyWithCode:'pspd'] setTo:v];
}

- (NSString *) productVersion
{
	return [[self propertyWithCode:'ver2'] get];
}

- (NSString *) version
{
	return [[self propertyWithCode:'vers'] get];
}



@end


@implementation FinderAliasFile


- (SBObject *) originalItem
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'orig'];
}

- (void) setOriginalItem: (SBObject *) originalItem
{
	[[self propertyWithClass:[SBObject class] code:'orig'] setTo:originalItem];
}



@end


@implementation FinderApplicationFile


- (NSString *) id
{
	return [[self propertyWithCode:'ID  '] get];
}

- (NSInteger) suggestedSize
{
	id v = [[self propertyWithCode:'sprt'] get];
	return [v integerValue];
}

- (NSInteger) minimumSize
{
	id v = [[self propertyWithCode:'mprt'] get];
	return [v integerValue];
}

- (void) setMinimumSize: (NSInteger) minimumSize
{
	id v = [NSNumber numberWithInteger:minimumSize];
	[[self propertyWithCode:'mprt'] setTo:v];
}

- (NSInteger) preferredSize
{
	id v = [[self propertyWithCode:'appt'] get];
	return [v integerValue];
}

- (void) setPreferredSize: (NSInteger) preferredSize
{
	id v = [NSNumber numberWithInteger:preferredSize];
	[[self propertyWithCode:'appt'] setTo:v];
}

- (BOOL) acceptsHighLevelEvents
{
	id v = [[self propertyWithCode:'isab'] get];
	return [v boolValue];
}

- (BOOL) hasScriptingTerminology
{
	id v = [[self propertyWithCode:'hscr'] get];
	return [v boolValue];
}

- (BOOL) opensInClassic
{
	id v = [[self propertyWithCode:'Clsc'] get];
	return [v boolValue];
}

- (void) setOpensInClassic: (BOOL) opensInClassic
{
	id v = [NSNumber numberWithBool:opensInClassic];
	[[self propertyWithCode:'Clsc'] setTo:v];
}

@end


/*
 * Window classes
 */

@implementation FinderWindow


- (NSInteger) id
{
	id v = [[self propertyWithCode:'ID  '] get];
	return [v integerValue];
}

- (NSPoint) position
{
	id v = [[self propertyWithCode:'posn'] get];
	return [v pointValue];
}

- (void) setPosition: (NSPoint) position
{
	id v = [NSValue valueWithPoint:position];
	[[self propertyWithCode:'posn'] setTo:v];
}

- (NSRect) bounds
{
	id v = [[self propertyWithCode:'pbnd'] get];
	return [v rectValue];
}

- (void) setBounds: (NSRect) bounds
{
	id v = [NSValue valueWithRect:bounds];
	[[self propertyWithCode:'pbnd'] setTo:v];
}

- (BOOL) titled
{
	id v = [[self propertyWithCode:'ptit'] get];
	return [v boolValue];
}

- (NSString *) name
{
	return [[self propertyWithCode:'pnam'] get];
}

- (NSInteger) index
{
	id v = [[self propertyWithCode:'pidx'] get];
	return [v integerValue];
}

- (void) setIndex: (NSInteger) index
{
	id v = [NSNumber numberWithInteger:index];
	[[self propertyWithCode:'pidx'] setTo:v];
}

- (BOOL) closeable
{
	id v = [[self propertyWithCode:'hclb'] get];
	return [v boolValue];
}

- (BOOL) floating
{
	id v = [[self propertyWithCode:'isfl'] get];
	return [v boolValue];
}

- (BOOL) modal
{
	id v = [[self propertyWithCode:'pmod'] get];
	return [v boolValue];
}

- (BOOL) resizable
{
	id v = [[self propertyWithCode:'prsz'] get];
	return [v boolValue];
}

- (BOOL) zoomable
{
	id v = [[self propertyWithCode:'iszm'] get];
	return [v boolValue];
}

- (BOOL) zoomed
{
	id v = [[self propertyWithCode:'pzum'] get];
	return [v boolValue];
}

- (void) setZoomed: (BOOL) zoomed
{
	id v = [NSNumber numberWithBool:zoomed];
	[[self propertyWithCode:'pzum'] setTo:v];
}

- (BOOL) visible
{
	id v = [[self propertyWithCode:'pvis'] get];
	return [v boolValue];
}

- (BOOL) collapsed
{
	id v = [[self propertyWithCode:'wshd'] get];
	return [v boolValue];
}

- (void) setCollapsed: (BOOL) collapsed
{
	id v = [NSNumber numberWithBool:collapsed];
	[[self propertyWithCode:'wshd'] setTo:v];
}

- (NSDictionary *) properties
{
	return [[self propertyWithCode:'pALL'] get];
}

- (void) setProperties: (NSDictionary *) properties
{
	[[self propertyWithCode:'pALL'] setTo:properties];
}


- (void) openUsing:(SBObject *)using_ withProperties:(NSDictionary *)withProperties
{
	[self sendEvent:'aevt' id:'odoc' parameters:'usin', using_, 'prdt', withProperties, 0];
}

- (void) printWithProperties:(NSDictionary *)withProperties
{
	[self sendEvent:'aevt' id:'pdoc' parameters:'prdt', withProperties, 0];
}

- (void) activate
{
	[self sendEvent:'misc' id:'actv' parameters:0];
}

- (void) close
{
	[self sendEvent:'core' id:'clos' parameters:0];
}

- (NSInteger) dataSizeAs:(NSNumber *)as
{
	id result__ = [self sendEvent:'core' id:'dsiz' parameters:'rtyp', as, 0];
	return [result__ integerValue];
}

- (SBObject *) delete
{
	id result__ = [self sendEvent:'core' id:'delo' parameters:0];
	return result__;
}

- (SBObject *) duplicateTo:(SBObject *)to replacing:(BOOL)replacing routingSuppressed:(BOOL)routingSuppressed exactCopy:(BOOL)exactCopy
{
	id result__ = [self sendEvent:'core' id:'clon' parameters:'insh', to, 'alrp', [NSNumber numberWithBool:replacing], 'rout', [NSNumber numberWithBool:routingSuppressed], 'exct', [NSNumber numberWithBool:exactCopy], 0];
	return result__;
}

- (BOOL) exists
{
	id result__ = [self sendEvent:'core' id:'doex' parameters:0];
	return [result__ boolValue];
}

- (SBObject *) moveTo:(SBObject *)to replacing:(BOOL)replacing positionedAt:(NSArray *)positionedAt routingSuppressed:(BOOL)routingSuppressed
{
	id result__ = [self sendEvent:'core' id:'move' parameters:'insh', to, 'alrp', [NSNumber numberWithBool:replacing], 'mvpl', positionedAt, 'rout', [NSNumber numberWithBool:routingSuppressed], 0];
	return result__;
}

- (void) select
{
	[self sendEvent:'misc' id:'slct' parameters:0];
}

- (void) eject
{
	[self sendEvent:'fndr' id:'ejct' parameters:0];
}

- (void) emptySecurity:(BOOL)security
{
	[self sendEvent:'fndr' id:'empt' parameters:'sec\?', [NSNumber numberWithBool:security], 0];
}

- (void) erase
{
	[self sendEvent:'fndr' id:'fera' parameters:0];
}

- (void) reveal
{
	[self sendEvent:'misc' id:'mvis' parameters:0];
}

- (void) updateNecessity:(BOOL)necessity registeringApplications:(BOOL)registeringApplications
{
	[self sendEvent:'fndr' id:'fupd' parameters:'nec\?', [NSNumber numberWithBool:necessity], 'reg\?', [NSNumber numberWithBool:registeringApplications], 0];
}


@end


@implementation FinderFinderWindow


- (SBObject *) target
{
	return (SBObject *) [self propertyWithClass:[SBObject class] code:'fvtg'];
}

- (void) setTarget: (SBObject *) target
{
	[[self propertyWithClass:[SBObject class] code:'fvtg'] setTo:target];
}

- (FinderEcvw) currentView
{
	id v = [[self propertyWithCode:'pvew'] get];
	return [v enumCodeValue];
}

- (void) setCurrentView: (FinderEcvw) currentView
{
	id v = [NSAppleEventDescriptor descriptorWithEnumCode:currentView];
	[[self propertyWithCode:'pvew'] setTo:v];
}

- (BOOL) toolbarVisible
{
	id v = [[self propertyWithCode:'tbvi'] get];
	return [v boolValue];
}

- (void) setToolbarVisible: (BOOL) toolbarVisible
{
	id v = [NSNumber numberWithBool:toolbarVisible];
	[[self propertyWithCode:'tbvi'] setTo:v];
}

- (BOOL) statusbarVisible
{
	id v = [[self propertyWithCode:'stvi'] get];
	return [v boolValue];
}

- (void) setStatusbarVisible: (BOOL) statusbarVisible
{
	id v = [NSNumber numberWithBool:statusbarVisible];
	[[self propertyWithCode:'stvi'] setTo:v];
}

- (NSInteger) sidebarWidth
{
	id v = [[self propertyWithCode:'sbwi'] get];
	return [v integerValue];
}

- (void) setSidebarWidth: (NSInteger) sidebarWidth
{
	id v = [NSNumber numberWithInteger:sidebarWidth];
	[[self propertyWithCode:'sbwi'] setTo:v];
}



@end

