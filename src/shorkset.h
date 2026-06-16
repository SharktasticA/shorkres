/*
    ######################################################
    ##             SHORK UTILITY - SHORKSET             ##
    ######################################################
    ## Main program logic                               ##
    ######################################################
    ## Licence: GNU GENERAL PUBLIC LICENSE Version 3    ##
    ######################################################
    ## Kali (links.sharktastica.co.uk)                  ##
    ######################################################
*/



#ifndef SHORKSET
#define SHORKSET

#include "shorkmenu.h"

#include <linux/limits.h>



typedef struct {
    // Display resolution code (default: 3840)
    int dispRes;
    // Font colour name (default: "white")
    char fontColName[32];
    // Font colour ANSI escape code (default: "0;37")
    char fontColANSI[32];
    // Font PSF path (default: "default")
    char fontPSF[PATH_MAX];
} Config;



#define MAX_FONTS 256

static const char *CFG_PATHS[] = {
    "/boot/grub/grub.cfg",
    "/boot/syslinux/syslinux.cfg"
};
static const int CFG_PATHS_LEN = sizeof(CFG_PATHS) / sizeof(CFG_PATHS[0]);
static Config CONFIG = { 3840, "white", "0;37", "default" };
static char CONFONTS[MAX_FONTS][PATH_MAX];
static int CONFONTS_COUNT = 0;
static const char *DOT_CONF = "/etc/shorkset.conf";
static const char *CONFONTS_DIR = "/usr/share/consolefonts";

void applyFontColFiles(char*);
void applyFontColTtys(char*);
void applyFontPSF(char*);
void getCurrRes(void);
void loadConf(void);
int loadConFonts(void);
void saveDispRes(MenuItem, int);
void saveFontCol(MenuItem);
void saveFontPSF(MenuItem);
void showDispResMenu(void);
void showFontColMenu(void);
void showFontPSFMenu(void);
void showHelp(void);
void showMainMenu(void);
void writeConf(void);

#endif
