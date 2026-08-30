\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zh_beamer}[Chinese Academic Beamer Template]

% 不允许向 zh_beamer 传递任何参数
\DeclareOption*{%
  \ClassWarning{zh_beamer}{Option `\CurrentOption' is not allowed and will be ignored}%
}
\ProcessOptions\relax
\LoadClass[aspectratio=169,16pt,xcolor=table]{beamer}

% 基础宏包
\RequirePackage[UTF8,heading=false,fontset=none]{ctex}
\RequirePackage{booktabs}
\RequirePackage{tcolorbox}
\RequirePackage{lmodern}

% 字体配置（按需修改 fonts/ 路径）
\setCJKmainfont[Path=fonts/, UprightFont=*, BoldFont=msyhbd,
ItalicFont=msyhl]{msyh.ttc}
\setCJKsansfont[Path=fonts/, UprightFont=*, BoldFont=msyhbd,
ItalicFont=msyhl]{msyh.ttc}
\setCJKmonofont[Path=fonts/, UprightFont=*, BoldFont=msyhbd,
ItalicFont=msyhl]{msyh.ttc}
\setsansfont[Path=fonts/, UprightFont=*, BoldFont={Arial Bold},
ItalicFont={Arial Italic}, BoldItalicFont={Arial Bold Italic}]{Arial.ttf}

% 主题与样式配置
\usetheme[colortheme=paper]{moloch}
\molochcolors{
  light/alerted text=orange,
  light/progressbar fg=orange
}
\setbeamertemplate{page number in head/foot}[appendixframenumber]
\usefonttheme[onlymath]{serif}

% 颜色定义（蓝 / 红配色，用于自定义 tcolorbox）
\definecolor{CustomBlue}{HTML}{4097E2}
\definecolor{CustomDarkBlue}{HTML}{0374D9}
\definecolor{ColBackLightBlue}{HTML}{F3F8FE}
\definecolor{CustomRed}{HTML}{FF7069}
\definecolor{CustomDarkRed}{HTML}{FF4136}
\definecolor{ColBackLightRed}{HTML}{FFF6F5}

% 列表间距压缩命令
\newcommand{\tightlist}{%
  \setlength{\itemsep}{0.2em}%
  \setlength{\parskip}{0pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\topsep}{0pt}%
  \setlength{\partopsep}{0pt}%
}

% 预设 tcolorbox 样式
\newtcolorbox{mainbox}[2][]{%
  center, halign=left, title={#2}, fontupper=\scriptsize,
  colframe=black, colback=white, colbacktitle=black, coltitle=white,
  boxrule=1pt, arc=2mm,
  before upper={\setlength{\leftmargini}{0em}}, #1
}
\newtcolorbox{bluebox}[2][]{%
  center, halign=left, title={#2}, fontupper=\scriptsize,
  colframe=CustomDarkBlue, colback=ColBackLightBlue,
  colbacktitle=CustomBlue, coltitle=white,
  boxrule=1pt, arc=2mm,
  before upper={\setlength{\leftmargini}{0em}}, #1
}
\newtcolorbox{redbox}[2][]{%
  center, halign=left, title={#2}, fontupper=\scriptsize,
  colframe=CustomDarkRed, colback=ColBackLightRed,
  colbacktitle=CustomRed, coltitle=white,
  boxrule=1pt, arc=2mm,
  before upper={\setlength{\leftmargini}{0em}}, #1
}

\endinput
