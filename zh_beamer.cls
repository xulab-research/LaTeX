\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zh_beamer}[Chinese Academic Beamer Template]

% 不允许传递任何参数
\DeclareOption*{%
  \ClassWarning{zh_beamer}{Option `\CurrentOption' is not allowed and will be ignored}%
}
\ProcessOptions\relax
\LoadClass[aspectratio=169,16pt,xcolor=table]{beamer}

% 基础宏包
\RequirePackage[heading=false,fontset=none]{ctex}

% 英文断行/连字：提供英文断字规则、直引号弯引号等排版细节
\RequirePackage[english]{babel}

% 数学符号集合
\RequirePackage{unicode-math}

% 字体配置（按需修改 fonts/ 路径）
\setCJKmainfont[Path=fonts/, UprightFont=*, BoldFont=msyhbd,
ItalicFont=msyhl]{msyh.ttc}
\setCJKsansfont[Path=fonts/, UprightFont=*, BoldFont=msyhbd,
ItalicFont=msyhl]{msyh.ttc}
\setCJKmonofont[Path=fonts/, UprightFont=*, BoldFont=msyhbd,
ItalicFont=msyhl]{msyh.ttc}
\setsansfont[Path=fonts/, UprightFont=*, BoldFont={Arial Bold},
ItalicFont={Arial Italic}, BoldItalicFont={Arial Bold Italic}]{Arial.ttf}

% 数学字体设置
\setmathfont{TeX Gyre Termes Math}

% 优化中西文混排断行与字距弹性，消除 Underfull \hbox
\xeCJKsetup{CJKecglue=\hspace{0.25em plus 0.15em minus 0.05em}}

% 三线表
\RequirePackage{booktabs}
\RequirePackage{tcolorbox}
\RequirePackage{lmodern}

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
  \setlength{\itemsep}{0.15em}%
  \setlength{\parskip}{0pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\topsep}{0pt}%
  \setlength{\partopsep}{0pt}%
}

% 预设 tcolorbox 样式
\tcbset{
  compactbox/.style={
    center, halign=left, fontupper=\scriptsize, fonttitle=\scriptsize\bfseries,
    boxrule=0.8pt, arc=1.5mm,
    top=1mm, bottom=1mm, left=1.5mm, right=1.5mm,
    middle=1mm, boxsep=0.5mm,
    before upper={\setlength{\leftmargini}{1em}}
  }
}

\newtcolorbox{mainbox}[2][]{%
  compactbox, title={#2},
  colframe=black, colback=white, colbacktitle=black, coltitle=white, #1
}
\newtcolorbox{bluebox}[2][]{%
  compactbox, title={#2},
  colframe=CustomDarkBlue, colback=ColBackLightBlue,
  colbacktitle=CustomBlue, coltitle=white, #1
}
\newtcolorbox{redbox}[2][]{%
  compactbox, title={#2},
  colframe=CustomDarkRed, colback=ColBackLightRed,
  colbacktitle=CustomRed, coltitle=white, #1
}
