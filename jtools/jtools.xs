#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <colors.h>
#include <jDockApp.h>
#include <locations.h>
#include <xutils.h>

static int
not_here(char *s)
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(char *name, int arg)
{
    errno = 0;
    switch (*name) {
    case 'A':
	break;
    case 'B':
	if (strEQ(name, "BLUE"))
#ifdef BLUE
	    return BLUE;
#else
	    goto not_there;
#endif
	break;
    case 'C':
	if (strEQ(name, "CYAN"))
#ifdef CYAN
	    return CYAN;
#else
	    goto not_there;
#endif
	break;
    case 'D':
	break;
    case 'E':
	break;
    case 'F':
	break;
    case 'G':
	if (strEQ(name, "GREEN"))
#ifdef GREEN
	    return GREEN;
#else
	    goto not_there;
#endif
	break;
    case 'H':
	break;
    case 'I':
	if (strEQ(name, "INDIGO"))
#ifdef INDIGO
	    return INDIGO;
#else
	    goto not_there;
#endif
	break;
    case 'J':
	if (strEQ(name, "JetDockApp_H"))
#ifdef JetDockApp_H
	    return JetDockApp_H;
#else
	    goto not_there;
#endif
	break;
    case 'K':
	break;
    case 'L':
	break;
    case 'M':
	break;
    case 'N':
	if (strEQ(name, "NUMBERS"))
#ifdef NUMBERS
	    return NUMBERS;
#else
	    goto not_there;
#endif
	break;
    case 'O':
	if (strEQ(name, "ORANGE"))
#ifdef ORANGE
	    return ORANGE;
#else
	    goto not_there;
#endif
	break;
    case 'P':
	if (strEQ(name, "PINK"))
#ifdef PINK
	    return PINK;
#else
	    goto not_there;
#endif
	break;
    case 'Q':
	break;
    case 'R':
	if (strEQ(name, "RED"))
#ifdef RED
	    return RED;
#else
	    goto not_there;
#endif
	break;
    case 'S':
	break;
    case 'T':
	break;
    case 'U':
	break;
    case 'V':
	if (strEQ(name, "VIOLET"))
#ifdef VIOLET
	    return VIOLET;
#else
	    goto not_there;
#endif
	break;
    case 'W':
	if (strEQ(name, "WMGENERAL_H_INCLUDED"))
#ifdef WMGENERAL_H_INCLUDED
	    return WMGENERAL_H_INCLUDED;
#else
	    goto not_there;
#endif
	break;
    case 'X':
	break;
    case 'Y':
	if (strEQ(name, "YELLOW"))
#ifdef YELLOW
	    return YELLOW;
#else
	    goto not_there;
#endif
	break;
    case 'Z':
	break;
    case 'a':
	break;
    case 'b':
	break;
    case 'c':
	break;
    case 'd':
	break;
    case 'e':
	break;
    case 'f':
	if (strEQ(name, "false"))
#ifdef false
	    return false;
#else
	    goto not_there;
#endif
	break;
    case 'g':
	break;
    case 'h':
	break;
    case 'i':
	break;
    case 'j':
	break;
    case 'k':
	break;
    case 'l':
	break;
    case 'm':
	break;
    case 'n':
	break;
    case 'o':
	break;
    case 'p':
	break;
    case 'q':
	break;
    case 'r':
	break;
    case 's':
	break;
    case 't':
	if (strEQ(name, "true"))
#ifdef true
	    return true;
#else
	    goto not_there;
#endif
	break;
    case 'u':
	break;
    case 'v':
	break;
    case 'w':
	break;
    case 'x':
	break;
    case 'y':
	break;
    case 'z':
	break;
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}

static SV * _setup  = (SV*) NULL;
static SV * _expose = (SV*) NULL;
static SV * _update = (SV*) NULL;
static SV * _button = (SV*) NULL;

void setup() {
    dSP;

    if(_setup == (SV*) NULL)
        return;

    PUSHMARK(SP);
    perl_call_sv(_setup, G_DISCARD);
}

void do_expose() {
    dSP;

    if(_expose == (SV*) NULL) {
        fprintf(stderr, "Can't do an expose ... freakin' out!\n");
        fprintf(stderr, "Perhaps somebody should set one...\n");
        exit(1);
    }

    PUSHMARK(SP);
    perl_call_sv(_expose, G_DISCARD);
}

void do_update() {
    dSP;

    if(_update == (SV*) NULL) {
        fprintf(stderr, "Can't do an update ... freakin' out!\n");
        fprintf(stderr, "Perhaps somebody should set one...\n");
        exit(1);
    }

    PUSHMARK(SP);
    perl_call_sv(_update, G_DISCARD);
}

void do_button_release() {
    dSP;

    if(_button == (SV*) NULL)
        return;

    PUSHMARK(SP);
    perl_call_sv(_button, G_DISCARD);
}

MODULE = Wharf::JDockApp::jtools	PACKAGE = Wharf::JDockApp::jtools		

double
constant(name,arg)
	char *		name
	int		arg

void 
jprint(color,str)
        int color
        char *str
        CODE:
        jprintf(color, str);

void 
jpprint(x,y,color,str)
        int x
        int y
	int color
        char *str
        CODE:
        jpprintf(x, y, color, str);

void
set_setup(name)
    SV *    name
    CODE:
    if (_setup == (SV*)NULL)
        _setup = newSVsv(name);
    else
        SvSetSV(_setup, name);

void
set_expose(name)
    SV *    name
    CODE:
    if (_expose == (SV*)NULL)
        _expose = newSVsv(name);
    else
        SvSetSV(_expose, name);

void
set_update(name)
    SV *    name
    CODE:
    if (_update == (SV*)NULL)
        _update = newSVsv(name);
    else
        SvSetSV(_update, name);

void
set_button(name)
    SV *    name
    CODE:
    if (_button == (SV*)NULL)
        _button = newSVsv(name);
    else
        SvSetSV(_button, name);

void
set_update_delay(d)
        int d

void
set_loop_delay(d)
        int d

void
clear_window()

void 
start_app()
    CODE:
    fprintf(stderr, ""); // this shouldn't help, but it does.
    start_app();
