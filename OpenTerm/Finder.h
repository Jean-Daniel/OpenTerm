/*
 * Finder.h
 */

#import <AppKit/AppKit.h>
#import <ScriptingBridge/ScriptingBridge.h>


@class FinderApplication, FinderItem, FinderContainer, FinderComputerObject, FinderDisk, FinderFolder, FinderDesktopObject, FinderTrashObject, FinderFile, FinderAliasFile, FinderApplicationFile, FinderDocumentFile, FinderInternetLocationFile, FinderClipping, FinderPackage, FinderWindow, FinderFinderWindow;

enum FinderPriv {
	FinderPrivReadOnly = 'read',
	FinderPrivReadWrite = 'rdwr',
	FinderPrivWriteOnly = 'writ',
	FinderPrivNone = 'none'
};
typedef enum FinderPriv FinderPriv;

enum FinderEdfm {
	FinderEdfmMacOSFormat = 'dfhf',
	FinderEdfmMacOSExtendedFormat = 'dfh+',
	FinderEdfmUFSFormat = 'dfuf',
	FinderEdfmNFSFormat = 'dfnf',
	FinderEdfmAudioFormat = 'dfau',
	FinderEdfmProDOSFormat = 'dfpr',
	FinderEdfmMSDOSFormat = 'dfms',
	FinderEdfmNTFSFormat = 'dfnt',
	FinderEdfmISO9660Format = 'df96',
	FinderEdfmHighSierraFormat = 'dfhs',
	FinderEdfmQuickTakeFormat = 'dfqt',
	FinderEdfmApplePhotoFormat = 'dfph',
	FinderEdfmAppleShareFormat = 'dfas',
	FinderEdfmUDFFormat = 'dfud',
	FinderEdfmWebDAVFormat = 'dfwd',
	FinderEdfmFTPFormat = 'dfft',
	FinderEdfmPacketWrittenUDFFormat = 'dfpu',
	FinderEdfmXsanFormat = 'dfac',
	FinderEdfmUnknownFormat = 'df\?\?'
};
typedef enum FinderEdfm FinderEdfm;

enum FinderIpnl {
	FinderIpnlGeneralInformationPanel = 'gpnl',
	FinderIpnlSharingPanel = 'spnl',
	FinderIpnlMemoryPanel = 'mpnl',
	FinderIpnlPreviewPanel = 'vpnl',
	FinderIpnlApplicationPanel = 'apnl',
	FinderIpnlLanguagesPanel = 'pklg',
	FinderIpnlPluginsPanel = 'pkpg',
	FinderIpnlNameExtensionPanel = 'npnl',
	FinderIpnlCommentsPanel = 'cpnl',
	FinderIpnlContentIndexPanel = 'cinl',
	FinderIpnlBurningPanel = 'bpnl',
	FinderIpnlMoreInfoPanel = 'minl',
	FinderIpnlSimpleHeaderPanel = 'shnl'
};
typedef enum FinderIpnl FinderIpnl;

enum FinderPple {
	FinderPpleGeneralPreferencesPanel = 'pgnp',
	FinderPpleLabelPreferencesPanel = 'plbp',
	FinderPpleSidebarPreferencesPanel = 'psid',
	FinderPpleAdvancedPreferencesPanel = 'padv'
};
typedef enum FinderPple FinderPple;

enum FinderEcvw {
	FinderEcvwIconView = 'icnv',
	FinderEcvwListView = 'lsvw',
	FinderEcvwColumnView = 'clvw',
	FinderEcvwGroupView = 'grvw',
	FinderEcvwFlowView = 'flvw'
};
typedef enum FinderEcvw FinderEcvw;

enum FinderEarr {
	FinderEarrNotArranged = 'narr',
	FinderEarrSnapToGrid = 'grda',
	FinderEarrArrangedByName = 'nama',
	FinderEarrArrangedByModificationDate = 'mdta',
	FinderEarrArrangedByCreationDate = 'cdta',
	FinderEarrArrangedBySize = 'siza',
	FinderEarrArrangedByKind = 'kina',
	FinderEarrArrangedByLabel = 'laba'
};
typedef enum FinderEarr FinderEarr;

enum FinderEpos {
	FinderEposRight = 'lrgt',
	FinderEposBottom = 'lbot'
};
typedef enum FinderEpos FinderEpos;

enum FinderSodr {
	FinderSodrNormal = 'snrm',
	FinderSodrReversed = 'srvs'
};
typedef enum FinderSodr FinderSodr;

enum FinderElsv {
	FinderElsvNameColumn = 'elsn',
	FinderElsvModificationDateColumn = 'elsm',
	FinderElsvCreationDateColumn = 'elsc',
	FinderElsvSizeColumn = 'elss',
	FinderElsvKindColumn = 'elsk',
	FinderElsvLabelColumn = 'elsl',
	FinderElsvVersionColumn = 'elsv',
	FinderElsvCommentColumn = 'elsC'
};
typedef enum FinderElsv FinderElsv;

enum FinderLvic {
	FinderLvicSmallIcon = 'smic',
	FinderLvicLargeIcon = 'lgic'
};
typedef enum FinderLvic FinderLvic;



/*
 * Finder Basics
 */

// The Finder
@interface FinderApplication : SBApplication

- (SBElementArray *) items;
- (SBElementArray *) containers;
- (SBElementArray *) disks;
- (SBElementArray *) folders;
- (SBElementArray *) files;
- (SBElementArray *) aliasFiles;
- (SBElementArray *) applicationFiles;
- (SBElementArray *) documentFiles;
- (SBElementArray *) internetLocationFiles;
- (SBElementArray *) clippings;
- (SBElementArray *) packages;
- (SBElementArray *) windows;
- (SBElementArray *) FinderWindows;
- (SBElementArray *) clippingWindows;

@property (copy, readonly) SBObject *clipboard;  // (NOT AVAILABLE YET) the Finder’s clipboard window
@property (copy, readonly) NSString *name;  // the Finder’s name
@property BOOL visible;  // Is the Finder’s layer visible?
@property BOOL frontmost;  // Is the Finder the frontmost process?
@property (copy) SBObject *selection;  // the selection in the frontmost Finder window
@property (copy, readonly) SBObject *insertionLocation;  // the container in which a new folder would appear if “New Folder” was selected
@property (copy, readonly) NSString *productVersion;  // the version of the System software running on this computer
@property (copy, readonly) NSString *version;  // the version of the Finder
@property (copy, readonly) FinderDisk *startupDisk;  // the startup disk
@property (copy, readonly) FinderDesktopObject *desktop;  // the desktop
@property (copy, readonly) FinderTrashObject *trash;  // the trash
@property (copy, readonly) FinderFolder *home;  // the home directory
@property (copy, readonly) FinderComputerObject *computerContainer;  // the computer location (as in Go > Computer)

- (void) quit;  // Quit the Finder
- (void) activate;  // Activate the specified window (or the Finder)
- (void) copy;  // (NOT AVAILABLE YET) Copy the selected items to the clipboard (the Finder must be the front application)
- (void) eject;  // Eject the specified disk(s)
- (void) emptySecurity:(BOOL)security;  // Empty the trash
- (void) restart;  // Restart the computer
- (void) shutDown;  // Shut Down the computer
- (void) sleep;  // Put the computer to sleep

@end



/*
 * Finder items
 */

// An item
@interface FinderItem : SBObject

@property (copy) NSString *name;  // the name of the item
@property (copy, readonly) NSString *displayedName;  // the user-visible name of the item
@property (copy) NSString *nameExtension;  // the name extension of the item (such as “txt”)
@property BOOL extensionHidden;  // Is the item's extension hidden from the user?
@property (readonly) NSInteger index;  // the index in the front-to-back ordering within its container
@property (copy, readonly) SBObject *container;  // the container of the item
@property (copy, readonly) SBObject *disk;  // the disk on which the item is stored
@property NSPoint position;  // the position of the item within its parent window (can only be set for an item in a window viewed as icons or buttons)
@property NSPoint desktopPosition;  // the position of the item on the desktop
@property NSRect bounds;  // the bounding rectangle of the item (can only be set for an item in a window viewed as icons or buttons)
@property NSInteger labelIndex;  // the label of the item
@property BOOL locked;  // Is the file locked?
@property (copy, readonly) NSString *kind;  // the kind of the item
@property (copy, readonly) NSString *objectDescription;  // a description of the item
@property (copy) NSString *comment;  // the comment of the item, displayed in the “Get Info” window
@property (readonly) long long size;  // the logical size of the item
@property (readonly) long long physicalSize;  // the actual space used by the item on disk
@property (copy, readonly) NSDate *creationDate;  // the date on which the item was created
@property (copy) NSDate *modificationDate;  // the date on which the item was last modified
@property (copy, readonly) NSString *URL;  // the URL of the item
@property (copy) NSString *owner;  // the user that owns the container
@property (copy) NSString *group;  // the user or group that has special access to the container
@property FinderPriv ownerPrivileges;
@property FinderPriv groupPrivileges;
@property FinderPriv everyonesPrivileges;
@property (copy, readonly) SBObject *informationWindow;  // the information window for the item
@property (copy) NSDictionary *properties;  // every property of an item

- (void) openUsing:(SBObject *)using_ withProperties:(NSDictionary *)withProperties;  // Open the specified object(s)
- (void) printWithProperties:(NSDictionary *)withProperties;  // Print the specified object(s)
- (void) activate;  // Activate the specified window (or the Finder)
- (void) close;  // Close an object
- (NSInteger) dataSizeAs:(NSNumber *)as;  // Return the size in bytes of an object
- (SBObject *) delete;  // Move an item from its container to the trash
- (SBObject *) duplicateTo:(SBObject *)to replacing:(BOOL)replacing routingSuppressed:(BOOL)routingSuppressed exactCopy:(BOOL)exactCopy;  // Duplicate one or more object(s)
- (BOOL) exists;  // Verify if an object exists
- (SBObject *) moveTo:(SBObject *)to replacing:(BOOL)replacing positionedAt:(NSArray *)positionedAt routingSuppressed:(BOOL)routingSuppressed;  // Move object(s) to a new location
- (void) select;  // Select the specified object(s)
- (void) eject;  // Eject the specified disk(s)
- (void) emptySecurity:(BOOL)security;  // Empty the trash
- (void) erase;  // (NOT AVAILABLE) Erase the specified disk(s)
- (void) reveal;  // Bring the specified object(s) into view
- (void) updateNecessity:(BOOL)necessity registeringApplications:(BOOL)registeringApplications;  // Update the display of the specified object(s) to match their on-disk representation

@end



/*
 * Containers and folders
 */

// An item that contains other items
@interface FinderContainer : FinderItem

- (SBElementArray *) items;
- (SBElementArray *) containers;
- (SBElementArray *) folders;
- (SBElementArray *) files;
- (SBElementArray *) aliasFiles;
- (SBElementArray *) applicationFiles;
- (SBElementArray *) documentFiles;
- (SBElementArray *) internetLocationFiles;
- (SBElementArray *) clippings;
- (SBElementArray *) packages;

@property (copy, readonly) SBObject *entireContents;  // the entire contents of the container, including the contents of its children
@property (readonly) BOOL expandable;  // (NOT AVAILABLE YET) Is the container capable of being expanded as an outline?
@property BOOL expanded;  // (NOT AVAILABLE YET) Is the container opened as an outline? (can only be set for containers viewed as lists)
@property BOOL completelyExpanded;  // (NOT AVAILABLE YET) Are the container and all of its children opened as outlines? (can only be set for containers viewed as lists)
@property (copy, readonly) SBObject *containerWindow;  // the container window for this folder


@end

// the Computer location (as in Go > Computer)
@interface FinderComputerObject : FinderItem


@end

// A disk
@interface FinderDisk : FinderContainer

- (SBElementArray *) items;
- (SBElementArray *) containers;
- (SBElementArray *) folders;
- (SBElementArray *) files;
- (SBElementArray *) aliasFiles;
- (SBElementArray *) applicationFiles;
- (SBElementArray *) documentFiles;
- (SBElementArray *) internetLocationFiles;
- (SBElementArray *) clippings;
- (SBElementArray *) packages;

- (NSInteger) id;  // the unique id for this disk (unchanged while disk remains connected and Finder remains running)
@property (readonly) long long capacity;  // the total number of bytes (free or used) on the disk
@property (readonly) long long freeSpace;  // the number of free bytes left on the disk
@property (readonly) BOOL ejectable;  // Can the media be ejected (floppies, CDs, and so on)?
@property (readonly) BOOL localVolume;  // Is the media a local volume (as opposed to a file server)?
@property (readonly) BOOL startup;  // Is this disk the boot disk?
@property (readonly) FinderEdfm format;  // the filesystem format of this disk
@property (readonly) BOOL journalingEnabled;  // Does this disk do file system journaling?
@property BOOL ignorePrivileges;  // Ignore permissions on this disk?


@end

// A folder
@interface FinderFolder : FinderContainer

- (SBElementArray *) items;
- (SBElementArray *) containers;
- (SBElementArray *) folders;
- (SBElementArray *) files;
- (SBElementArray *) aliasFiles;
- (SBElementArray *) applicationFiles;
- (SBElementArray *) documentFiles;
- (SBElementArray *) internetLocationFiles;
- (SBElementArray *) clippings;
- (SBElementArray *) packages;


@end

// Desktop-object is the class of the “desktop” object
@interface FinderDesktopObject : FinderContainer

- (SBElementArray *) items;
- (SBElementArray *) containers;
- (SBElementArray *) disks;
- (SBElementArray *) folders;
- (SBElementArray *) files;
- (SBElementArray *) aliasFiles;
- (SBElementArray *) applicationFiles;
- (SBElementArray *) documentFiles;
- (SBElementArray *) internetLocationFiles;
- (SBElementArray *) clippings;
- (SBElementArray *) packages;


@end

// Trash-object is the class of the “trash” object
@interface FinderTrashObject : FinderContainer

- (SBElementArray *) items;
- (SBElementArray *) containers;
- (SBElementArray *) folders;
- (SBElementArray *) files;
- (SBElementArray *) aliasFiles;
- (SBElementArray *) applicationFiles;
- (SBElementArray *) documentFiles;
- (SBElementArray *) internetLocationFiles;
- (SBElementArray *) clippings;
- (SBElementArray *) packages;

@property BOOL warnsBeforeEmptying;  // Display a dialog when emptying the trash?


@end



/*
 * Files
 */

// A file
@interface FinderFile : FinderItem

@property (copy) NSNumber *fileType;  // the OSType identifying the type of data contained in the item
@property (copy) NSNumber *creatorType;  // the OSType identifying the application that created the item
@property BOOL stationery;  // Is the file a stationery pad?
@property (copy, readonly) NSString *productVersion;  // the version of the product (visible at the top of the “Get Info” window)
@property (copy, readonly) NSString *version;  // the version of the file (visible at the bottom of the “Get Info” window)


@end

// An alias file (created with “Make Alias”)
@interface FinderAliasFile : FinderFile

@property (copy) SBObject *originalItem;  // the original item pointed to by the alias


@end

// An application's file on disk
@interface FinderApplicationFile : FinderFile

- (NSString *) id;  // the bundle identifier or creator type of the application
@property (readonly) NSInteger suggestedSize;  // (AVAILABLE IN 10.1 TO 10.4) the memory size with which the developer recommends the application be launched
@property NSInteger minimumSize;  // (AVAILABLE IN 10.1 TO 10.4) the smallest memory size with which the application can be launched
@property NSInteger preferredSize;  // (AVAILABLE IN 10.1 TO 10.4) the memory size with which the application will be launched
@property (readonly) BOOL acceptsHighLevelEvents;  // Is the application high-level event aware? (OBSOLETE: always returns true)
@property (readonly) BOOL hasScriptingTerminology;  // Does the process have a scripting terminology, i.e., can it be scripted?
@property BOOL opensInClassic;  // (AVAILABLE IN 10.1 TO 10.4) Should the application launch in the Classic environment?


@end

// A document file
@interface FinderDocumentFile : FinderFile


@end

// A file containing an internet location
@interface FinderInternetLocationFile : FinderFile

@property (copy, readonly) NSString *location;  // the internet location


@end

// A clipping
@interface FinderClipping : FinderFile

@property (copy, readonly) SBObject *clippingWindow;  // (NOT AVAILABLE YET) the clipping window for this clipping


@end

// A package
@interface FinderPackage : FinderItem


@end



/*
 * Window classes
 */

// A window
@interface FinderWindow : SBObject

- (NSInteger) id;  // the unique id for this window
@property NSPoint position;  // the upper left position of the window
@property NSRect bounds;  // the boundary rectangle for the window
@property (readonly) BOOL titled;  // Does the window have a title bar?
@property (copy, readonly) NSString *name;  // the name of the window
@property NSInteger index;  // the number of the window in the front-to-back layer ordering
@property (readonly) BOOL closeable;  // Does the window have a close box?
@property (readonly) BOOL floating;  // Does the window have a title bar?
@property (readonly) BOOL modal;  // Is the window modal?
@property (readonly) BOOL resizable;  // Is the window resizable?
@property (readonly) BOOL zoomable;  // Is the window zoomable?
@property BOOL zoomed;  // Is the window zoomed?
@property (readonly) BOOL visible;  // Is the window visible (always true for open Finder windows)?
@property BOOL collapsed;  // Is the window collapsed
@property (copy) NSDictionary *properties;  // every property of a window

- (void) openUsing:(SBObject *)using_ withProperties:(NSDictionary *)withProperties;  // Open the specified object(s)
- (void) printWithProperties:(NSDictionary *)withProperties;  // Print the specified object(s)
- (void) activate;  // Activate the specified window (or the Finder)
- (void) close;  // Close an object
- (NSInteger) dataSizeAs:(NSNumber *)as;  // Return the size in bytes of an object
- (SBObject *) delete;  // Move an item from its container to the trash
- (SBObject *) duplicateTo:(SBObject *)to replacing:(BOOL)replacing routingSuppressed:(BOOL)routingSuppressed exactCopy:(BOOL)exactCopy;  // Duplicate one or more object(s)
- (BOOL) exists;  // Verify if an object exists
- (SBObject *) moveTo:(SBObject *)to replacing:(BOOL)replacing positionedAt:(NSArray *)positionedAt routingSuppressed:(BOOL)routingSuppressed;  // Move object(s) to a new location
- (void) select;  // Select the specified object(s)
- (void) eject;  // Eject the specified disk(s)
- (void) emptySecurity:(BOOL)security;  // Empty the trash
- (void) erase;  // (NOT AVAILABLE) Erase the specified disk(s)
- (void) reveal;  // Bring the specified object(s) into view
- (void) updateNecessity:(BOOL)necessity registeringApplications:(BOOL)registeringApplications;  // Update the display of the specified object(s) to match their on-disk representation

@end

// A file viewer window
@interface FinderFinderWindow : FinderWindow

@property (copy) SBObject *target;  // the container at which this file viewer is targeted
@property FinderEcvw currentView;  // the current view for the container window
@property BOOL toolbarVisible;  // Is the window's toolbar visible?
@property BOOL statusbarVisible;  // Is the window's status bar visible?
@property NSInteger sidebarWidth;  // the width of the sidebar for the container window


@end

