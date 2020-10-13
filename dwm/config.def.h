/* See LICENSE file for copyright and license details. */

/* Constants (copied from Luke Smith) */
#define TERMINAL "st"

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 20;       /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const char *fonts[]          = { "Font Awesome:size=18" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_green[]       = "#006600";
static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_gray3, col_gray1, col_gray1 },
    [SchemeSel]  = { col_green, col_gray1, col_green },
};

/* status bar */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const int user_bh = 40;                  /* height of status bar */

/* tagging */
static const char *tags[] = { 
    "", "", "", "", "", "", "", "", "" 
};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	/* { "[]=",      tile },         /1* first entry is default *1/ */
	/* { "><>",      NULL },         /1* no layout function means floating behavior *1/ */
	/* { "[M]",      monocle }, */
	/* { "TTT",      bstack },       /1* alt-u *1/ */
	/* { "===",      bstackhoriz },  /1* alt-o *1/ */
  	/* { "[@]",      spiral },       /1* alt-r *1/ */
  	/* { "[\\]",     dwindle },      /1* alt-shift-r *1/ */
	{ "",      tile },         /* first entry is default */
	{ "",      NULL },         /* no layout function means floating behavior */
	{ "",      monocle },
	{ "",      bstack },       /* alt-u */
	{ "",      bstackhoriz },  /* alt-o */
  	{ "",      spiral },       /* alt-r */
  	{ "",      dwindle },      /* alt-shift-r */
};

/* key definitions */
#define MODKEY Mod1Mask
#define CMDKEY Mod4Mask  /* Mod4Mask  = cmd key */ 
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_green, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */

	{ CMDKEY,                       XK_w,      spawn,          SHCMD(TERMINAL " -e nvim -u $CONF/nvim/init.vim $DROPBOX/vimwiki/index.wiki") },
	{ CMDKEY,                       XK_r,      spawn,          SHCMD(TERMINAL " -e ranger --confdir $CONF/ranger") },  /* confdir param not really needed? */
	{ CMDKEY,                       XK_t,      spawn,          SHCMD(TERMINAL) },
	{ CMDKEY,                       XK_a,      spawn,          SHCMD("anki") },
	{ CMDKEY,                       XK_s,      spawn,          SHCMD("spotify") },
	/* { CMDKEY,                       XK_s,      spawn,          SHCMD("slack") }, */
	{ CMDKEY,                       XK_f,      spawn,          SHCMD(TERMINAL " -e fzf") },
	/* { MODKEY,                       XK_c,      spawn,          SHCMD(TERMINAL " -e cd $CONF && ls") }, */
	{ CMDKEY,                       XK_c,      spawn,          SHCMD("sh $HOME/Documents/critical_driving_scenarios/project/carla/CarlaUE4.sh -opengl3 -quality-level=Low") },
	{ CMDKEY,                       XK_v,      spawn,          SHCMD(TERMINAL " -e nvim -u ~/.config/nvim/init.vim") },
	{ CMDKEY,                       XK_q,      killclient,     {0} },
	{ CMDKEY,                       XK_b,      spawn,          SHCMD("qutebrowser") },
	{ CMDKEY,                       XK_n,      spawn,          SHCMD(TERMINAL " -e task next") },
	{ CMDKEY,                       XK_m,      spawn,          SHCMD(TERMINAL " -e gotop --color=solarized") },
	/* { MODKEY,                       XK_m,      spawn,          SHCMD(TERMINAL " -e nvim -u $CONF/nvim/init.vim") }, */

	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_o,      setlayout,      {.v = &layouts[4]} },
 	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[5]} },
 	{ MODKEY|ShiftMask,             XK_r,      setlayout,      {.v = &layouts[6]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

